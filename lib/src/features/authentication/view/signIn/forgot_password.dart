import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:smivox_inventory_software/src/commons/smivox_button.dart';
import 'package:smivox_inventory_software/src/commons/smivox_input_fields.dart';
import 'package:smivox_inventory_software/src/features/authentication/components/heading_and_subheading.dart';
import 'package:smivox_inventory_software/src/features/authentication/repository/auth_repository.dart';
import 'package:smivox_inventory_software/src/res/app_strings.dart';
import 'package:smivox_inventory_software/src/services/api_service.dart';
import 'package:smivox_inventory_software/src/utils/route_path.dart';
import '../../../../commons/app_colors.dart';
import '../../../../commons/common_methods.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController emailController = TextEditingController();

  bool _isLoading = false;
  bool _isButtonEnabled = false;
  String? _errorMessage;
  final AuthRepository _authRepository = AuthRepository(ApiService());

  @override
  void initState() {
    super.initState();
    _validateForm();

    emailController.addListener(_validateForm);
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
                  heading: AppTexts.forgotPassword,
                  subHeading: AppTexts.forgotPasswordSubText,
                ),
                SmivoxInputFields(
                  hintText: AppTexts.email,
                  leadingIcon: Icon(
                    Icons.mail_outline_rounded,
                    color: AppColors.inactiveGrey,
                  ),
                  controller: emailController,
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

                const SizedBox(height: 10),
                IgnorePointer(
                   ignoring: !_isButtonEnabled || _isLoading,
                   child: SmivoxButton(
                     text: "Send",
                     isLoading: _isLoading,
                     color: _isButtonEnabled ? null : Colors.grey,
                     onTap: handleForgotPassword,
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
       emailController.text.trim(),
    ];

    // Check if any field is empty
    if (fields.any((field) => field.isEmpty)) {
      setState(() {
        _isButtonEnabled = false;
        _errorMessage = "Please enter your email";
      });
      return;
    }

    setState(() {
      _isButtonEnabled = true;
      _errorMessage = null;
    });
  }

  void handleForgotPassword() async {
    if (_isLoading) return;

    if (!_isButtonEnabled) return;

    setState(() {
        _isLoading = true;
    });

    try {
        final response = await _authRepository.forgotPassword(email: emailController.text.trim());

        if (response.success) {
            CommonMethods.showSuccess(context: context, message: response.message.toString());
            CommonMethods.sendToNextScreen(context, RoutesPath.genLoginScreen);
        } else {
          CommonMethods.showError(context: context, message: response.message.toString());
        }
    } catch (e) {
        CommonMethods.showError(context: context, message: e.toString());
    } finally {
       setState(() {
         _isLoading = false;
       });
    }
  }
}
