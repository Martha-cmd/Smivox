import 'package:smivox_inventory_software/src/core/responses.dart';
import 'package:smivox_inventory_software/src/features/authentication/model/store_registration_model.dart';
import 'package:smivox_inventory_software/src/services/api_service.dart';
import 'package:smivox_inventory_software/src/res/endpoints.dart';

class StoreAuthRepository {
  final ApiService _apiService;

  StoreAuthRepository(this._apiService);

  Future<Responses> registerStore(StoreRegistrationModel model) async {
      try {
         final body = model.toJson();

         final response = await _apiService.postRequest(
             EndPoints.registerStore,
             body: body,
             requiresAuth: false,
         );

         return response;
      } catch (e) {
          return Responses(
             success: false,
             message: e.toString(),
            statusCode: 500
          );
      }
  }

}