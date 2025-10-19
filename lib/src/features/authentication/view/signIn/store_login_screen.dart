import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smivox_inventory_software/src/commons/smivox_button.dart';
import 'package:smivox_inventory_software/src/commons/smivox_input_fields.dart';
import 'package:smivox_inventory_software/src/core/storage/storage_manager.dart';
import 'package:smivox_inventory_software/src/features/authentication/components/heading_and_subheading.dart';
import 'package:smivox_inventory_software/src/features/authentication/repository/auth_repository.dart';
import 'package:smivox_inventory_software/src/res/app_strings.dart';
import 'package:smivox_inventory_software/src/services/api_service.dart';
import 'package:smivox_inventory_software/src/utils/route_path.dart';
import '../../../../commons/app_colors.dart';
import '../../../../commons/common_methods.dart';

class StoreLoginScreen extends StatefulWidget {
  const StoreLoginScreen({super.key});

  @override
  State<StoreLoginScreen> createState() => _StoreLoginScreenState();
}

class _StoreLoginScreenState extends State<StoreLoginScreen> {
  final TextEditingController storeEmailController = TextEditingController();
  final TextEditingController storePasswordController = TextEditingController();
  final _authRepository = AuthRepository(ApiService());


  bool _isButtonEnabled = false;
  String? _errorMessage;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    // _authRepository = AuthRepository(ApiService());
    _validateForm();

    storeEmailController.addListener(_validateForm);
    storePasswordController.addListener(_validateForm);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              spacing: 20,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                HeadingAndSubheading(
                  heading: AppTexts.welcome,
                  subHeading: AppTexts.welcomeBackSubText,
                ),


                SmivoxInputFields(
                    hintText: AppTexts.storeEmailLabel,
                    controller: storeEmailController,
                    leadingIcon: SvgPicture.asset(
                      "assets/onboarding/mail.svg", width: 18,)
                ),


                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  spacing: 4,
                  children: [
                    SmivoxInputFields(
                      hintText: AppTexts.password,
                      leadingIcon: SvgPicture.asset(
                          "assets/onboarding/lock.svg", width: 18),
                      obscureText: true,
                      controller: storePasswordController,
                      suffixIcon: Icon(
                        CupertinoIcons.eye_slash,
                        color: AppColors.inactiveGrey,
                        size: 16,
                      ),
                    ),
                    GestureDetector(
                      onTap:
                          () =>
                          CommonMethods.replaceWithNextScreen(
                            context,
                            RoutesPath.forgotPasswordScreen,
                          ),
                      child: CommonMethods.appTexts(
                        context,
                        "forgot password?",
                        color: AppColors.inactiveGrey,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 10),
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

                const SizedBox(height: 10),
                IgnorePointer(
                  ignoring: !_isButtonEnabled || _isLoading,
                  child: SmivoxButton(
                    text: "Login",
                    onTap: _login,
                    color: _isButtonEnabled ? null : Colors.grey,
                    isLoading: _isLoading,
                  ),
                ),
                Row(
                  spacing: 5,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CommonMethods.appTexts(
                      context,
                      "Don't have a ${AppTexts.storeName} account?",
                      fontSize: 14,
                    ),
                    GestureDetector(
                      onTap:
                          () =>
                          CommonMethods.replaceWithNextScreen(
                            context,
                            RoutesPath.storeRegistrationScreen,
                          ),
                      child: CommonMethods.appTexts(
                        context,
                        "Create an account",
                        color: Color(0xFF0311D7),
                        fontWeight: FontWeight.w500,
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
      storeEmailController.text.trim(),
      storePasswordController.text.trim(),
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
    if (!emailRegex.hasMatch(storeEmailController.text.trim())) {
      setState(() {
        _isButtonEnabled = false;
        _errorMessage = "Please enter a valid email address";
      });
      return;
    }

    // If all validations pass
    setState(() {
      _isButtonEnabled = true;
      _errorMessage = null;
    });
  }

  void _login() async {
    if (_isLoading) return;

    if (!_isButtonEnabled) return;

    setState(() {
      _isLoading = true;
    });

    try {
      final response = await _authRepository.storeLogin(
        businessEmail: storeEmailController.text.trim(),
        password: storePasswordController.text.trim(),
      );

      if (response.success) {
        final Map<String, dynamic> storeData = response.data ?? {};


        final accessToken = storeData['idToken'];
        final refreshToken = storeData['refreshToken'];


        if (accessToken != null && accessToken.isNotEmpty) {
          await StorageManager.saveAccessToken(accessToken);
        }

        if (refreshToken != null && refreshToken.isNotEmpty) {
          await StorageManager.saveRefreshToken(refreshToken);
        }

        await StorageManager.clearStoreData();
        await StorageManager.saveStoreData(storeData);
        await StorageManager.setCurrentStep("/genLogin");
        CommonMethods.replaceWithNextScreen(context, RoutesPath.genLoginScreen);
      } else {
        CommonMethods.showError(
            context: context, message: response.message.toString());
      }
    } catch (e) {
      CommonMethods.showError(context: context, message: e.toString());
    } finally {
      setState(() {
        _isLoading = false;
      });
    };
  }
}
