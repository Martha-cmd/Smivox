import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smivox_inventory_software/src/commons/smivox_button.dart';
import 'package:smivox_inventory_software/src/commons/smivox_input_fields.dart';
import 'package:smivox_inventory_software/src/features/authentication/components/heading_and_subheading.dart';
import 'package:smivox_inventory_software/src/res/app_strings.dart';
import 'package:smivox_inventory_software/src/utils/route_path.dart';

import '../../../../commons/app_colors.dart';
import '../../../../commons/common_methods.dart';



class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
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
                HeadingAndSubheading(heading: AppTexts.forgotPassword, subHeading: AppTexts.forgotPasswordSubText),
                SmivoxInputFields(hintText: AppTexts.email, leadingIcon: Icon(Icons.mail_outline_rounded, color: AppColors.inactiveGrey)),

                const SizedBox(height: 10),
                SmivoxButton(
                  text: "Send",
                  onTap: () => CommonMethods.replaceWithNextScreen(context, RoutesPath.resetPasswordScreen),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
