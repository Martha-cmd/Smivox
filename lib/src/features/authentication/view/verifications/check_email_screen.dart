import 'package:flutter/material.dart';
import 'package:smivox_inventory_software/src/commons/app_colors.dart';
import 'package:smivox_inventory_software/src/commons/common_methods.dart';
import 'package:smivox_inventory_software/src/commons/smivox_button.dart';
import 'package:smivox_inventory_software/src/features/authentication/components/heading_and_subheading.dart';
import 'package:smivox_inventory_software/src/utils/route_path.dart';

class CheckEmailScreen extends StatelessWidget {
  const CheckEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GestureDetector(
          onTap:
              () => CommonMethods.sendToNextScreen(
                context,
                RoutesPath.verifiedScreen,
              ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 20,
              children: [
                CommonMethods.appTexts(
                  context,
                  "You're Almost In",
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
                Image.asset("assets/images/mailbox.png"),
                const SizedBox(height: 10),
                HeadingAndSubheading(
                  heading: "Check your email",
                  subHeading:
                      "We sent you an email to verify your account. Check your inbox, your confirmation email is waiting",
                  letterSpacing: 0.5,
                  subHeadingColor: Colors.black,
                  fontSize: 16,
                ),
                const SizedBox(height: 10),
                SmivoxButton(
                  text: "Continue",
                  color: AppColors.primary,
                  textColor: Colors.white,
                  onTap: () => CommonMethods.sendToNextScreen(context, RoutesPath.storeLoginScreen),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
