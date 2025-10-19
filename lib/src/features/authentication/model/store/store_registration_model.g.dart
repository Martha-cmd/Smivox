// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_registration_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StoreRegistrationModel _$StoreRegistrationModelFromJson(
  Map<String, dynamic> json,
) => StoreRegistrationModel(
  companyName: json['companyName'] as String,
  businessEmail: json['businessEmail'] as String,
  country: json['country'] as String,
  state: json['state'] as String,
  city: json['city'] as String,
  businessNature: json['businessNature'] as String,
  address: json['address'] as String,
  currency: json['currency'] as String?,
  otherDetails: json['otherDetails'] as String?,
  profilePicture: json['profilePicture'] as String?,
  password: json['password'] as String,
  confirmPassword: json['confirmPassword'] as String,
);

Map<String, dynamic> _$StoreRegistrationModelToJson(
  StoreRegistrationModel instance,
) => <String, dynamic>{
  'companyName': instance.companyName,
  'businessEmail': instance.businessEmail,
  'country': instance.country,
  'state': instance.state,
  'city': instance.city,
  'businessNature': instance.businessNature,
  'address': instance.address,
  'currency': instance.currency,
  'otherDetails': instance.otherDetails,
  'profilePicture': instance.profilePicture,
  'password': instance.password,
  'confirmPassword': instance.confirmPassword,
};
