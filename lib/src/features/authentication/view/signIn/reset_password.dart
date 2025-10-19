import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smivox_inventory_software/src/commons/smivox_button.dart';
import 'package:smivox_inventory_software/src/commons/smivox_input_fields.dart';
import 'package:smivox_inventory_software/src/features/authentication/components/heading_and_subheading.dart';
import 'package:smivox_inventory_software/src/res/app_strings.dart';
import '../../../../commons/app_colors.dart';
import '../../../../commons/common_methods.dart';
import '../../../../utils/route_path.dart';


class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
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
                HeadingAndSubheading(heading: AppTexts.resetPassword, subHeading: AppTexts.resetPasswordSubText),
                SmivoxInputFields(headText: AppTexts.password, hintText: "Create new password", leadingIcon: Icon(CupertinoIcons.lock, color: AppColors.inactiveGrey, size: 20,), suffixIcon: Icon(CupertinoIcons.eye_slash, color: AppColors.inactiveGrey, size: 16),),
                SmivoxInputFields(headText: AppTexts.confirmPassword, hintText: "Confirm new password", leadingIcon: Icon(CupertinoIcons.lock, color: AppColors.inactiveGrey), suffixIcon: Icon(CupertinoIcons.eye_slash, color: AppColors.inactiveGrey, size: 16),),

                const SizedBox(height: 10),
                SmivoxButton(
                  text: "Reset",
                  onTap: () => CommonMethods.replaceWithNextScreen(context, RoutesPath.genLoginScreen),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
