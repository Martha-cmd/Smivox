import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smivox_inventory_software/src/commons/smivox_button.dart';
import 'package:smivox_inventory_software/src/commons/smivox_input_fields.dart';
import 'package:smivox_inventory_software/src/res/app_strings.dart';
import '../../../commons/app_colors.dart';
import '../components/heading_and_subheading.dart';

class PersonalDetailsScreen extends StatefulWidget {
  const PersonalDetailsScreen({super.key});

  @override
  State<PersonalDetailsScreen> createState() => _PersonalDetailsState();
}

class _PersonalDetailsState extends State<PersonalDetailsScreen> {
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
                Image.asset("assets/logo/logo.png", width: 100,),
                HeadingAndSubheading(heading: AppTexts.enterPersonalDetails, subHeading: AppTexts.subTextPersonalDeets),
                const SizedBox(height: 1),
                Column(
                  spacing: 20,
                  children: [
                    SmivoxInputFields(headText: AppTexts.firstName, labelColor: Colors.black, hintText: "Timothy", leadingIcon: Icon(CupertinoIcons.person, color: AppColors.inactiveGrey)),
                    SmivoxInputFields(headText: AppTexts.lastName, labelColor: Colors.black, hintText: "Stone", leadingIcon: Icon(CupertinoIcons.person, color: AppColors.inactiveGrey)),
                    SmivoxInputFields(headText: AppTexts.email, labelColor: Colors.black, hintText: "timstone@gmail.com", leadingIcon: Icon(Icons.mail_outline_rounded, color: AppColors.inactiveGrey), suffixIcon: Icon(CupertinoIcons.chevron_down, size: 15)),
                    SmivoxInputFields(headText: AppTexts.password, labelColor: Colors.black, hintText: "Enter a secure password", leadingIcon: Icon(CupertinoIcons.lock, color: AppColors.inactiveGrey), suffixIcon: Icon(CupertinoIcons.chevron_down, size: 15)),
                    SmivoxInputFields(headText: AppTexts.confirmPassword, labelColor: Colors.black, hintText: "Confirm your password", leadingIcon: Icon(CupertinoIcons.lock, color: AppColors.inactiveGrey), suffixIcon: Icon(CupertinoIcons.chevron_down, size: 15)),

                    SizedBox(height: 10),
                    RichText(
                      // textAlign: TextAlign.center,
                      text: TextSpan(
                        style: TextStyle(
                          fontSize: 14,
                        ),
                        children: [
                          const TextSpan(text: 'By creating your account, you agree to the ',
                              style: TextStyle(
                             color: AppColors.inactiveGrey,
                             fontFamily: "Poppins"
                          )),
                          TextSpan(
                            text: 'Terms of Service',
                              style: TextStyle(
                                fontSize: 14,
                                color: AppColors.primary,
                                fontWeight: FontWeight.w500,
                                  fontFamily: "Poppins"
                              ),
                            ),

                          const TextSpan(text: ' and ',
                              style: TextStyle(
                                color: AppColors.inactiveGrey,
                                  fontFamily: "Poppins",
                              )),
                          TextSpan(
                           text:
                              'Privacy Policy',
                              style: TextStyle(
                                fontSize: 14,
                                color: AppColors.primary,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: "Poppins"
                              ),
                          ),
                        ],
                      ),
                    ),
                    SmivoxButton(text: "Create your account"),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}



