import 'package:json_annotation/json_annotation.dart';

part 'user_registration_model.g.dart';

@JsonSerializable()
class UserRegistrationModel {
     final String firstName;
     final String lastName;
     final String email;
     final String password;
     final String storeId;

     UserRegistrationModel({
          required this.firstName,
          required this.lastName,
          required this.email,
          required this.password,
          required this.storeId,
     });

     factory UserRegistrationModel.fromJson(Map<String, dynamic> json) => _$UserRegistrationModelFromJson(json);

     Map<String, dynamic> toJson() => _$UserRegistrationModelToJson(this);
}