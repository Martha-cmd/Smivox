import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:smivox_inventory_software/src/core/responses.dart';
import '../core/storage/storage_manager.dart';


class ApiService {
  late final Dio _dio;


  ApiService() {
    _dio= Dio(BaseOptions(
        baseUrl: _baseUrl,
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 15),
    ));

    _dio.interceptors.add(LogInterceptor(
      requestBody: true,
      responseBody: true,
    ));
  }
   static String get _baseUrl {
       String baseUrl = dotenv.get('BASE_URL');
       return baseUrl.endsWith('/')  ? baseUrl.substring(0, baseUrl.length - 1)
       : baseUrl;
  }

  String _constructUrl(String endpoint) {
       final theEndpoint = endpoint.startsWith('/') ? endpoint.substring(1) : endpoint;
       return '$_baseUrl/$theEndpoint';
  }

  // Uri _buildUri(String endpoint, {Map<String, dynamic>? queryParameters}) {
  //      return Uri.parse(_constructUrl(endpoint)).replace(
  //          queryParameters: queryParameters?.map(
  //              (key, value) => MapEntry(key, value.toString()),
  //          )
  //      );
  // }

  Future<Map<String, dynamic>> _buildHeaders(bool requiresAuth) async {
     final headers = {'Accept': 'application/json'};
     if (requiresAuth) {
        final token = await StorageManager.getAccessToken();
        if (token != null) headers['Authorization'] = 'Bearer $token';
     }
     return headers;
  }

  String _handleDioError(DioException e) {
    if (e.response != null) {
      return e.response?.data?['message'] ??
          e.response?.statusMessage ??
          'Request failed';
    }
    return e.message ?? 'Network error';
  }

  // Responses _processResponse(Response response, {String? endpoint}) {
  //   final statusCode = response.statusCode ?? 500;
  //   final success = statusCode >= 200 && statusCode < 300;
  //
  //   final responseData = response.data;
  //   final data = responseData is Map<String, dynamic>
  //       ? (responseData['data'] ?? responseData)
  //       : {};
  //
  //   log('Processed API response for $endpoint → $data');
  //
  //   return Responses(
  //     success: success,
  //     message: (responseData is Map && responseData['message'] != null)
  //         ? responseData['message']
  //         : 'Success',
  //     data: response.data['data'],
  //     statusCode: statusCode,
  //   );
  // }
  Responses _processResponse(Response response, {String? endpoint}) {
    final statusCode = response.statusCode ?? 500;
    final success = statusCode >= 200 && statusCode < 300;

    final responseData = response.data;

    // Ensure it's a Map<String, dynamic>
    final Map<String, dynamic> parsedData =
    responseData is Map ? Map<String, dynamic>.from(responseData) : {};

    final message = parsedData['message'] ?? 'Success';

    // If backend wraps data in 'data', unwrap it; else use the full response
    final data = parsedData['data'] is Map
        ? Map<String, dynamic>.from(parsedData['data'])
        : parsedData;

    log('Processed API response for $endpoint → $data');

    return Responses(
      success: success,
      message: message,
      data: data,
      statusCode: statusCode,
    );
  }


  Future<bool> refreshToken() async {
    final refreshToken = StorageManager.getRefreshToken();

    if (refreshToken == null) {
      log('No refresh token found for refresh');
      return false;
    }

    try {
      final url = _constructUrl(
          'auth/refresh/');

      log('🔄 Attempting token refresh via $url');

      final response = await _dio.post(
        url,
        data: {'refresh': refreshToken},
        options: Options(
          headers: {'Content-Type': 'application/json'},
        ),
      );

      log('✅ Token refresh response: ${response.statusCode} | ${response
          .data}');

      if (response.statusCode == 200) {
        final data = response.data;

        final newAccessToken = data['access'] ?? data['accessToken'];
        final newRefreshToken = data['refresh'] ?? data['refreshToken'];

        if (newAccessToken != null) {
          await StorageManager.saveAccessToken(newAccessToken);

          if (newRefreshToken != null) {
            await StorageManager.saveRefreshToken(newRefreshToken);
          }

          log('Token refresh successful');
          StorageManager.logTokenStatus(); // optional debug log helper
          return true;
        } else {
          log('No access token found in response');
          return false;
        }
      } else if (response.statusCode == 401) {
        log('Refresh token invalid/expired, clearing auth data');
        await StorageManager.clearAuthData();
        return false;
      } else {
        log(' Token refresh failed: ${response.statusCode}');
        return false;
      }
    } on DioException catch (e) {
      log('Token refresh failed: ${_handleDioError(e)}');
      return false;
    } catch (e) {
      log('Token refresh error: $e');
      return false;
    }
  }

  Future<Responses> _retryRequest( Future<Response> Function() requestFn, String endpoint) async {
    log('Retrying request for $endpoint after token refresh...');

    final refreshed = await refreshToken();
    if (!refreshed) {
      log('Token refresh failed, logging out...');
      await StorageManager.clearAuthData();
      return Responses(
        success: false,
        message: 'Session expired. Please login again.',
        statusCode: 401,
      );
    }

    try {
      log('Token refreshed, retrying request...');
      final response = await requestFn();
      return _processResponse(response, endpoint: endpoint);
    } on DioException catch (e) {
      log('Retry request failed: $e');
      return Responses(
        success: false,
        message: _handleDioError(e),
        statusCode: e.response?.statusCode ?? 500,
      );
    }
  }

  Future<Responses> _makeRequestWithTokenRefresh(Future<Response> Function() requestFn, String endpoint, { bool requiresAuth = true,}) async {
    try {
      final response = await requestFn();

      if (response.statusCode == 401 && requiresAuth) {
        log('Unauthorized (401) for $endpoint — attempting token refresh...');
        return await _retryRequest(requestFn, endpoint);
      }

      return _processResponse(response, endpoint: endpoint);
    } on DioException catch (e) {
      log('Request failed for $endpoint: ${e.message}');
      return Responses(
        success: false,
        message: _handleDioError(e),
        statusCode: e.response?.statusCode ?? 500,
      );
    }
  }

  Future<Responses> getRequest (String endpoint, {Map<String, dynamic>? queryParameters, bool requiresAuth= true}) async {
      final fullUrl = _constructUrl(endpoint);

      return await _makeRequestWithTokenRefresh( () async {
        final headers = await _buildHeaders(requiresAuth);
        final response = await _dio.get(
            fullUrl,
            queryParameters: queryParameters,
            options: Options(headers: headers)
        );
        return response;
      },
        endpoint,
        requiresAuth: requiresAuth
      );
  }

  Future<Responses> postRequest (String endpoint, {Map<String, dynamic>? body, bool requiresAuth = true}) async {
      final fullUrl = _constructUrl(endpoint);

      return await _makeRequestWithTokenRefresh( () async {
          final headers = await _buildHeaders(requiresAuth);
          final response = await _dio.post(
            fullUrl,
            data: body,
            options: Options(headers: headers)
          );
          return response;
      },
        endpoint,
        requiresAuth: requiresAuth,
      );
  }

  Future<Responses> putRequest (String endpoint, {Map<String, dynamic>? body, bool requiresAuth = true}) async {
     final fullUrl = _constructUrl(endpoint);

     return await _makeRequestWithTokenRefresh ( () async {
         final headers = await _buildHeaders(requiresAuth);
         final response = await _dio.put(
             fullUrl,
             data: body,
             options: Options(headers: headers),
         );
         return response;
     },
        endpoint,
       requiresAuth: requiresAuth
     );
  }

  Future<Responses> deleteRequest (String endpoint, {Map<String, dynamic>? queryParameters, bool requiresAuth = true}) async {
      final fullUrl = await _constructUrl(endpoint);

      return await _makeRequestWithTokenRefresh(() async {
           final headers = await _buildHeaders(requiresAuth);
           final response = await _dio.delete(
               fullUrl,
               data: queryParameters,
              options: Options(headers: headers),
           );
           return response;
      },
        endpoint,
        requiresAuth: requiresAuth,
      );
  }
}