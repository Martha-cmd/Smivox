import 'package:json_annotation/json_annotation.dart';

part 'store_registration_model.g.dart';

@JsonSerializable()
class StoreRegistrationModel {
    final String companyName;
    final String businessEmail;
    final String country;
    final String state;
    final String city;
    final String businessNature;
    final String address;
    final String? currency;
    final String? otherDetails;
    final String? profilePicture;
    final String password;
    final String confirmPassword;


    StoreRegistrationModel ({
      required this.companyName,
      required this.businessEmail,
      required this.country,
      required this.state,
      required this.city,
      required this.businessNature,
      required this.address,
      required this.currency,
      this.otherDetails,
      this.profilePicture,
      required this.password,
      required this.confirmPassword,
    });

    factory StoreRegistrationModel.fromJson(Map<String, dynamic> json) => _$StoreRegistrationModelFromJson(json);

    Map<String, dynamic> toJson() => _$StoreRegistrationModelToJson(this);
}