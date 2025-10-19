// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_registration_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserRegistrationModel _$UserRegistrationModelFromJson(
  Map<String, dynamic> json,
) => UserRegistrationModel(
  firstName: json['firstName'] as String,
  lastName: json['lastName'] as String,
  email: json['email'] as String,
  password: json['password'] as String,
  storeId: json['storeId'] as String,
);

Map<String, dynamic> _$UserRegistrationModelToJson(
  UserRegistrationModel instance,
) => <String, dynamic>{
  'firstName': instance.firstName,
  'lastName': instance.lastName,
  'email': instance.email,
  'password': instance.password,
  'storeId': instance.storeId,
};
