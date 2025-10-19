import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smivox_inventory_software/src/commons/common_methods.dart';
import 'package:smivox_inventory_software/src/commons/smivox_button.dart';
import 'package:smivox_inventory_software/src/commons/smivox_input_fields.dart';
import 'package:smivox_inventory_software/src/core/responses.dart';
import 'package:smivox_inventory_software/src/core/storage/storage_manager.dart';
import 'package:smivox_inventory_software/src/features/authentication/model/user/user_registration_model.dart';
import 'package:smivox_inventory_software/src/features/authentication/repository/auth_repository.dart';
import 'package:smivox_inventory_software/src/res/app_strings.dart';
import 'package:smivox_inventory_software/src/services/api_service.dart';
import 'package:smivox_inventory_software/src/utils/route_path.dart';
import '../../../commons/app_colors.dart';
import '../components/heading_and_subheading.dart';

class PersonalDetailsScreen extends StatefulWidget {
  const PersonalDetailsScreen({super.key});

  @override
  State<PersonalDetailsScreen> createState() => _PersonalDetailsState();
}

class _PersonalDetailsState extends State<PersonalDetailsScreen> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _adminEmailController = TextEditingController();
  final TextEditingController _adminPasswordController = TextEditingController();
  final TextEditingController _adminConfirmPasswordController = TextEditingController();

  bool _isButtonEnabled = false;
  String? _errorMessage;
  bool _isRegistering = false;
  late final AuthRepository _authRepository;

  @override
  void initState() {
    super.initState();
    _authRepository = AuthRepository(ApiService());
    _validateForm();

    _firstNameController.addListener(_validateForm);
    _lastNameController.addListener(_validateForm);
    _adminEmailController.addListener(_validateForm);
    _adminPasswordController.addListener(_validateForm);
    _adminConfirmPasswordController.addListener(_validateForm);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              spacing: 20,
              children: [
                Image.asset("assets/logo/logo.png", width: 100),
                HeadingAndSubheading(
                  heading: AppTexts.enterPersonalDetails,
                  subHeading: AppTexts.subTextPersonalDeets,
                ),
                const SizedBox(height: 1),
                Column(
                  spacing: 20,
                  children: [
                    SmivoxInputFields(
                      headText: AppTexts.firstName,
                      labelColor: Colors.black,
                      hintText: "Timothy",
                      leadingIcon: SvgPicture.asset('assets/onboarding/user.svg', width: 18,),
                      controller: _firstNameController,
                    ),


                    SmivoxInputFields(
                      headText: AppTexts.lastName,
                      labelColor: Colors.black,
                      hintText: "Stone",
                      leadingIcon: SvgPicture.asset('assets/onboarding/user.svg', width: 18,),
                      controller: _lastNameController,
                    ),



                    SmivoxInputFields(
                      headText: AppTexts.email,
                      labelColor: Colors.black,
                      hintText: "timstone@gmail.com",
                      leadingIcon: SvgPicture.asset('assets/onboarding/mail.svg', width: 18,),
                      controller: _adminEmailController,
                    ),



                    SmivoxInputFields(
                      headText: AppTexts.password,
                      labelColor: Colors.black,
                      hintText: "Create a secure password",
                      leadingIcon: SvgPicture.asset('assets/onboarding/lock.svg', width: 18,),
                      suffixIcon: Icon(
                        CupertinoIcons.eye_slash,
                        color: AppColors.inactiveGrey,
                        size: 16,
                      ),
                      obscureText: true,
                      controller: _adminPasswordController,
                    ),



                    SmivoxInputFields(
                      headText: AppTexts.confirmPassword,
                      labelColor: Colors.black,
                      hintText: "Confirm your password",
                      leadingIcon: SvgPicture.asset('assets/onboarding/lock.svg', width: 18,),
                      suffixIcon: Icon(
                        CupertinoIcons.eye_slash,
                        color: AppColors.inactiveGrey,
                        size: 16,
                      ),
                      obscureText: true,
                      controller: _adminConfirmPasswordController,
                    ),

                    SizedBox(height: 5),

                    if (_errorMessage != null)
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.red[50],
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.red[200]!),
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.error_outline, color: Colors.red, size: 16),
                            SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                _errorMessage!,
                                style: TextStyle(
                                  color: Colors.red[700],
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                    IgnorePointer(
                      ignoring: !_isButtonEnabled || _isRegistering,
                      child: SmivoxButton(
                        text: "Create your account",
                        color: _isButtonEnabled ? null : Colors.grey,
                        isLoading: _isRegistering,
                        onTap: _registerAdmin,
                      ),
                    ),

                    RichText(
                      text: TextSpan(
                        style: TextStyle(fontSize: 14),
                        children: [
                          const TextSpan(
                            text: 'By creating your account, you agree to the ',
                            style: TextStyle(
                              color: AppColors.inactiveGrey,
                              fontFamily: "Poppins",
                            ),
                          ),
                          TextSpan(
                            text: 'Terms of Service',
                            style: TextStyle(
                              fontSize: 14,
                              color: AppColors.primary,
                              fontWeight: FontWeight.w500,
                              fontFamily: "Poppins",
                            ),
                          ),

                          const TextSpan(
                            text: ' and ',
                            style: TextStyle(
                              color: AppColors.inactiveGrey,
                              fontFamily: "Poppins",
                            ),
                          ),
                          TextSpan(
                            text: 'Privacy Policy',
                            style: TextStyle(
                              fontSize: 14,
                              color: AppColors.primary,
                              fontWeight: FontWeight.w500,
                              fontFamily: "Poppins",
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _validateForm() {
    log('=== VALIDATE FORM TRIGGERED ===');
    final fields = [
      _firstNameController.text.trim(),
      _lastNameController.text.trim(),
      _adminEmailController.text.trim(),
      _adminPasswordController.text.trim(),
      _adminConfirmPasswordController.text.trim(),
    ];

    // Check if any field is empty
    if (fields.any((field) => field.isEmpty)) {
      setState(() {
        _isButtonEnabled = false;
        _errorMessage = "Please fill in all fields";
      });
      return;
    }

    // Validate email format
    final emailRegex = RegExp(r'^[^\s@]+@[^\s@]+\.[^\s@]+$');
    if (!emailRegex.hasMatch(_adminEmailController.text.trim())) {
      setState(() {
        _isButtonEnabled = false;
        _errorMessage = "Please enter a valid email address";
      });
      return;
    }

    // Validate password match
    if (_adminPasswordController.text != _adminConfirmPasswordController.text) {
      setState(() {
        _isButtonEnabled = false;
        _errorMessage = "Passwords do not match";
      });
      return;
    }

    // Validate password length
    if (_adminPasswordController.text.length < 6) {
      setState(() {
        _isButtonEnabled = false;
        _errorMessage = "Password must be at least 6 characters";
      });
      return;
    }

    // If all validations pass
    setState(() {
      _isButtonEnabled = true;
      _errorMessage = null;
    });
  }

  Future<void> _registerAdmin () async {
      if (_isRegistering) return;

      if (!_isButtonEnabled) return;

      final storeData = StorageManager.getStoreData();
      log("StoreData: $storeData");
      final storeId = storeData?['id'];

      log("storedata: $storeId");


      final firstName = _firstNameController.text.trim();
      final lastName = _lastNameController.text.trim();
      final email = _adminEmailController.text.trim();
      final password = _adminPasswordController.text.trim();
      final confirmPassword = _adminConfirmPasswordController.text.trim();

      if (firstName.isEmpty || lastName.isEmpty || email.isEmpty || password.isEmpty || confirmPassword.isEmpty) {
        CommonMethods.showSnackBar(context: context, message: "Please fill all fields");
        return;
      }

      if (password != confirmPassword) {
        CommonMethods.showSnackBar(context: context, message: "Passwords do not match");
        return;
      }

      final model = UserRegistrationModel(
          firstName: firstName,
          lastName: lastName,
          email: email,
          password: password,
          storeId: storeId
      );

      setState(() {_isRegistering = true;});

      try {
          final Responses response = await _authRepository.registerAdmin(model);

          if (response.success) {
            log('Admin registration payload: ${model.toJson()}');
            final Map<String, dynamic> userData = response.data ?? {};

             await StorageManager.clearUserData();

             await StorageManager.saveUserData(userData);

            CommonMethods.showSuccess(context: context, message: "Registration Complete!");
            CommonMethods.replaceWithNextScreen(context, RoutesPath.checkYourEmailScreen);
          } else {
             CommonMethods.showError(context: context, message: response.message ?? "Registration failed");
          }
      } catch (e) {
         CommonMethods.showError(context: context, message:"Error $e");
      } finally {
         setState(() {
             _isRegistering = false;
         });
      }
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _adminEmailController.dispose();
    _adminPasswordController.dispose();
    _adminConfirmPasswordController.dispose();
    super.dispose();
  }

}
