import 'package:json_annotation/json_annotation.dart';

part 'store_model.g.dart';

@JsonSerializable()
class StoreModel {
   final String storeName;
   final String storeEmail;
   final String storeCountry;
   final String storeState;
   final String storeCity;
   final String storeAddress;
   final String storeNatureOfBusiness;
   final String? storeCurrency;
   final String? profilePicture;

   StoreModel({
        required this.storeName,
        required this.storeEmail,
        required this.storeCountry,
        required this.storeState,
        required this.storeCity,
        required this.storeAddress,
        required this.storeNatureOfBusiness,
        this.storeCurrency,
        this.profilePicture,
   });

   factory StoreModel.fromJson(Map<String, dynamic> json) => _$StoreModelFromJson(json);

   Map<String, dynamic> toJson() => _$StoreModelToJson(this);
}