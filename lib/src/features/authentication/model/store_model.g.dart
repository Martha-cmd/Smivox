// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StoreModel _$StoreModelFromJson(Map<String, dynamic> json) => StoreModel(
  storeName: json['storeName'] as String,
  storeEmail: json['storeEmail'] as String,
  storeCountry: json['storeCountry'] as String,
  storeState: json['storeState'] as String,
  storeCity: json['storeCity'] as String,
  storeAddress: json['storeAddress'] as String,
  storeNatureOfBusiness: json['storeNatureOfBusiness'] as String,
  storeCurrency: json['storeCurrency'] as String?,
  profilePicture: json['profilePicture'] as String?,
);

Map<String, dynamic> _$StoreModelToJson(StoreModel instance) =>
    <String, dynamic>{
      'storeName': instance.storeName,
      'storeEmail': instance.storeEmail,
      'storeCountry': instance.storeCountry,
      'storeState': instance.storeState,
      'storeCity': instance.storeCity,
      'storeAddress': instance.storeAddress,
      'storeNatureOfBusiness': instance.storeNatureOfBusiness,
      'storeCurrency': instance.storeCurrency,
      'profilePicture': instance.profilePicture,
    };
