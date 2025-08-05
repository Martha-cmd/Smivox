import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smivox_inventory_software/src/commons/smivox_button.dart';
import 'package:smivox_inventory_software/src/commons/smivox_input_fields.dart';
import 'package:smivox_inventory_software/src/features/authentication/components/heading_and_subheading.dart';
import 'package:smivox_inventory_software/src/res/app_strings.dart';
import 'package:smivox_inventory_software/src/utils/route_path.dart';

import '../../../../commons/app_colors.dart';
import '../../../../commons/common_methods.dart';


class CompanyLoginScreen extends StatefulWidget {
  const CompanyLoginScreen({super.key});

  @override
  State<CompanyLoginScreen> createState() => _CompanyLoginScreenState();
}

class _CompanyLoginScreenState extends State<CompanyLoginScreen> {
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
                    HeadingAndSubheading(heading: AppTexts.welcome, subHeading: AppTexts.welcomeBackSubText),
                    SmivoxInputFields(hintText: AppTexts.companyEmailLabel, leadingIcon: Icon(Icons.mail_outline_rounded, color: AppColors.inactiveGrey)),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    spacing: 4,
                    children: [
                      SmivoxInputFields(hintText: AppTexts.password, leadingIcon: Icon(CupertinoIcons.lock, color: AppColors.inactiveGrey), suffixIcon: Icon(CupertinoIcons.eye_slash, color: AppColors.inactiveGrey, size: 16),),
                      GestureDetector(
                        onTap: () => CommonMethods.replaceWithNextScreen(context, RoutesPath.forgotPasswordScreen),
                        child: CommonMethods.appTexts(context, "forgot password?", color: AppColors.inactiveGrey, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),

                    const SizedBox(height: 10),
                    SmivoxButton(
                      text: "Login",
                      onTap: () => CommonMethods.replaceWithNextScreen(context, RoutesPath.genLoginScreen),
                    ),
                  Row(
                    spacing: 5,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CommonMethods.appTexts(context, "Don't have a ${AppTexts.companyName} account?", fontSize: 14),
                      GestureDetector(
                         onTap: () => CommonMethods.replaceWithNextScreen(context, RoutesPath.companyRegistrationScreen),
                        child: CommonMethods.appTexts(context, "Create an account", color: Color(0xFF0311D7), fontWeight: FontWeight.w500),
                      )
                    ],
                  ),

                ],
             ),
           ),
         ),
       ),
    );
  }
}
