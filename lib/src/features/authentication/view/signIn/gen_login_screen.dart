import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smivox_inventory_software/src/features/authentication/components/heading_and_subheading.dart';
import 'package:smivox_inventory_software/src/res/app_strings.dart';
import '../../../../commons/app_colors.dart';
import '../../../../commons/common_methods.dart';
import '../../../../commons/smivox_button.dart';
import '../../../../commons/smivox_input_fields.dart';
import '../../../../utils/route_path.dart';


class GenLoginScreen extends StatefulWidget {
  const GenLoginScreen({super.key});

  @override
  State<GenLoginScreen> createState() => _GenLoginScreenState();
}

class _GenLoginScreenState extends State<GenLoginScreen> {
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
                HeadingAndSubheading(heading: AppTexts.welcomeBack, subHeading: AppTexts.genLoginSubText),
                SmivoxInputFields(headText: AppTexts.role, hintText: "Choose your role", leadingIcon: Icon(CupertinoIcons.person, color: AppColors.inactiveGrey, size: 18), suffixIcon: Icon(CupertinoIcons.chevron_down, color: AppColors.inactiveGrey, size: 15,)),
                SmivoxInputFields(headText: AppTexts.email, hintText: "Enter your email address", leadingIcon: Icon(Icons.mail_outline_rounded, size: 18, color: AppColors.inactiveGrey),),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  spacing: 4,
                  children: [
                    SmivoxInputFields(headText: AppTexts.password, hintText: "Enter your password", leadingIcon: Icon(CupertinoIcons.lock, size: 18, color: AppColors.inactiveGrey), suffixIcon: Icon(CupertinoIcons.eye_slash, color: AppColors.inactiveGrey, size: 15)),
                    GestureDetector(
                      onTap: () => CommonMethods.replaceWithNextScreen(context, RoutesPath.forgotPasswordScreen),
                      child: CommonMethods.appTexts(context, "forgot password?", color: AppColors.inactiveGrey, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                Spacer(),
                SmivoxButton(
                  text: "Login",
                  onTap: () => CommonMethods.replaceWithNextScreen(context, RoutesPath.bottomBar),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
