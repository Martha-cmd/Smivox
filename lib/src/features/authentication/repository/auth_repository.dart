import 'package:smivox_inventory_software/src/core/responses.dart';
import 'package:smivox_inventory_software/src/features/authentication/model/store/store_registration_model.dart';
import 'package:smivox_inventory_software/src/features/authentication/model/user/user_registration_model.dart';
import 'package:smivox_inventory_software/src/services/api_service.dart';
import 'package:smivox_inventory_software/src/res/endpoints.dart';

class AuthRepository {
  final ApiService _apiService;

  AuthRepository(this._apiService);

  Future<Responses> registerStore(StoreRegistrationModel model) async {
      try {
         final body = model.toJson();

         final response = await _apiService.postRequest(
             EndPoints.registerStore,
             body: body,
             requiresAuth: false,
         );

         return Responses(
           success: response.success,
           message: response.message,
           statusCode: response.statusCode,
           data: response.data ?? {},
         );
      } catch (e) {
          return Responses(
             success: false,
             message: e.toString(),
             statusCode: 500
          );
      }
  }

  Future<Responses> registerAdmin(UserRegistrationModel model) async {
        try {
           final body = model.toJson();

           final response = await _apiService.postRequest(
              EndPoints.registerAdmin,
              body: body,
              requiresAuth: false,
           );

           return response;
        } catch (e) {
           return Responses(
               success: false,
               statusCode: 500,
               message: e.toString(),
           );
        }
  }

  Future<Responses> storeLogin({required String businessEmail, required String password}) async {
      try {
         final body = {
            'businessEmail': businessEmail,
            'password': password,
         };

         final response = await _apiService.postRequest(
             EndPoints.storeLogin,
             body: body,
             requiresAuth: false,
         );

         return Responses(
           success: response.success,
           message: response.message,
           statusCode: response.statusCode,
           data: response.data ?? {},
         );
      } catch (e) {
        return Responses(
            success: false,
            message: e.toString(),
            statusCode: 500
        );
      }
  }

  Future<Responses> userLogin({required String role, required String email, required String password}) async {
      try {
          final body = {
            "role": role,
            "email": email,
            "password": password,
          };

          final response = await _apiService.postRequest(
              EndPoints.userLogin,
              body: body,
              requiresAuth: false,
          );

          return Responses(
              success: response.success,
              statusCode: response.statusCode,
            message: response.message,
            data: response.data ?? {}
          );
      } catch (e) {
          return Responses(
              success: false,
              statusCode: 500,
              message: e.toString(),
          );
      }
  }

  Future<Responses> forgotPassword({required String email}) async {
      try {
          final body = {
            "email": email,
          };

          final response = await _apiService.postRequest(
              EndPoints.forgotPassword,
              body: body,
              requiresAuth: false,
          );

          return Responses(
              success: response.success,
              statusCode: response.statusCode,
            message: response.message,
            data: response.data ?? {}
          );
      } catch (e) {
          return Responses(
              success: false,
              statusCode: 500,
              message: e.toString(),
          );
      }
  }

}