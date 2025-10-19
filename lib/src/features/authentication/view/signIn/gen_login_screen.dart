import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smivox_inventory_software/src/commons/smivox_drop_down.dart';
import 'package:smivox_inventory_software/src/features/authentication/components/heading_and_subheading.dart';
import 'package:smivox_inventory_software/src/features/authentication/repository/auth_repository.dart';
import 'package:smivox_inventory_software/src/res/app_strings.dart';
import 'package:smivox_inventory_software/src/services/api_service.dart';
import '../../../../commons/app_colors.dart';
import '../../../../commons/common_methods.dart';
import '../../../../commons/smivox_button.dart';
import '../../../../commons/smivox_input_fields.dart';
import '../../../../core/storage/storage_manager.dart';
import '../../../../utils/route_path.dart';

class GenLoginScreen extends StatefulWidget {
  const GenLoginScreen({super.key});

  @override
  State<GenLoginScreen> createState() => _GenLoginScreenState();
}

class _GenLoginScreenState extends State<GenLoginScreen> {
  String? _selectedRole;
  bool _isButtonEnabled = false;
  String? errorMessage;
  bool _isLoading = false;
  String? _errorMessage;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _roleController = TextEditingController();
  final AuthRepository _authRepository = AuthRepository(ApiService());

  @override
  void initState() {
    super.initState();
    _validateForm();

    _emailController.addListener(_validateForm);
    _passwordController.addListener(_validateForm);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              spacing: 20,
              children: [
                const SizedBox(height: 20),
                HeadingAndSubheading(
                  heading: AppTexts.welcomeBack,
                  subHeading: AppTexts.genLoginSubText,
                ),


                SmivoxPopupDropdown(
                  headText: AppTexts.role,
                  hintText: "Choose your role",
                  leadingIcon: Icon(
                    CupertinoIcons.person,
                    color: AppColors.inactiveGrey,
                    size: 18,
                  ),
                  value: _selectedRole,
                  fillColor: Colors.white,
                  onChanged: (String selectedValue) {
                    setState(() {
                      _selectedRole = selectedValue;
                    });
                  },
                  items: const ['Admin', 'Supervisor', 'Cashier'],
                ),


                SmivoxInputFields(
                  headText: AppTexts.email,
                  hintText: "Enter your email address",
                  leadingIcon: SvgPicture.asset("assets/onboarding/mail.svg", width: 18,),
                  controller: _emailController,
                ),


                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  spacing: 4,
                  children: [
                    SmivoxInputFields(
                      headText: AppTexts.password,
                      hintText: "Enter your password",
                      leadingIcon: SvgPicture.asset("assets/onboarding/lock.svg", width: 18),
                      controller: _passwordController,
                      suffixIcon: Icon(
                        CupertinoIcons.eye_slash,
                        color: AppColors.inactiveGrey,
                        size: 15,
                      ),
                    ),
                    GestureDetector(
                      onTap:
                          () => CommonMethods.replaceWithNextScreen(
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

                Spacer(),
                IgnorePointer(
                   ignoring: !_isButtonEnabled || _isLoading,
                   child: SmivoxButton(
                    text: "Login",
                     color: _isButtonEnabled ? null : Colors.grey,
                     isLoading: _isLoading,
                     onTap: _handleLogin,
                  ),
                )
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
      _emailController.text.trim(),
      _passwordController.text.trim(),
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
    if (!emailRegex.hasMatch(_emailController.text.trim())) {
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

  void _handleLogin() async {
    if (_isLoading) return;

    if (!_isButtonEnabled) return;

    setState(() {
      _isLoading = true;
    });

    try {
      final response = await _authRepository.userLogin(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
        role: _selectedRole?.toLowerCase() ?? '',
      );

      if (response.success) {
        final Map<String, dynamic> storeData = response.data ?? {};


        final accessToken = storeData['idToken'];
        final refreshToken = storeData['refreshToken'];


        if (accessToken != null && accessToken.isNotEmpty) {
          await StorageManager.saveUserAccessToken(accessToken);
        }

        if (refreshToken != null && refreshToken.isNotEmpty) {
          await StorageManager.saveUserRefreshToken(refreshToken);
        }

        await StorageManager.clearUserData();
        await StorageManager.saveUserData(storeData);
        await StorageManager.setCurrentStep("/dashboard");
        CommonMethods.showSuccess(context: context, message: response.message.toString());
        CommonMethods.replaceWithNextScreen(context, RoutesPath.bottomBar);
      } else {
        CommonMethods.showError(context: context, message: response.message.toString());
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
