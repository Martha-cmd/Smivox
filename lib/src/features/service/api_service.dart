import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiService {
    final Dio _dio;

    ApiService(String baseUrl)
        : _dio = Dio(BaseOptions(
        baseUrl: dotenv.env['BASE_URL']!,
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
        headers: {"Content-Type": "application/json"},
    )) {
        _dio.interceptors.add(LogInterceptor(
            request: true,
            requestBody: true,
            responseBody: true,
            error: true,
        ));
    }

    Future<dynamic> get(String endpoint) async {
        final response = await _dio.get(endpoint);
        return response.data;
    }

    Future<dynamic> post(String endpoint, Map<String, dynamic> body) async {
        final response = await _dio.post(endpoint, data: body);
        return response.data;
    }
}
