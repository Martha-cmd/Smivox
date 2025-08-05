import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smivox_inventory_software/src/commons/common_methods.dart';
import 'package:smivox_inventory_software/src/commons/smivox_button.dart';
import 'package:smivox_inventory_software/src/commons/smivox_input_fields.dart';
import 'package:smivox_inventory_software/src/res/app_strings.dart';
import 'package:smivox_inventory_software/src/utils/route_path.dart';
import '../../../commons/app_colors.dart';
import '../components/heading_and_subheading.dart';

class CompanyRegistrationScreen extends StatefulWidget {
  const CompanyRegistrationScreen({super.key});

  @override
  State<CompanyRegistrationScreen> createState() => _CompanyRegistrationScreenState();
}

class _CompanyRegistrationScreenState extends State<CompanyRegistrationScreen> {
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
                    HeadingAndSubheading(heading: AppTexts.welcomeToSmivox, subHeading: AppTexts.subtextCompanyReg,),
                    const SizedBox(height: 1),
                    Column(
                      spacing: 20,
                      children: [
                        SmivoxInputFields(headText: AppTexts.companyNameLabel, labelColor: Colors.black, hintText: "Market Square", leadingIcon: Icon(Icons.shopping_bag_outlined, color: AppColors.inactiveGrey)),
                        SmivoxInputFields(headText: AppTexts.companyEmailLabel, labelColor: Colors.black, hintText: "supermarkt@gmail.com", leadingIcon: Icon(Icons.mail_outline_rounded, color: AppColors.inactiveGrey)),
                        SmivoxInputFields(headText: AppTexts.country, labelColor: Colors.black, hintText: "Choose your country", leadingIcon: Icon(Icons.circle_outlined, color: AppColors.inactiveGrey), suffixIcon: Icon(CupertinoIcons.chevron_down, size: 15)),
                        SmivoxInputFields(headText: AppTexts.state, labelColor: Colors.black, hintText: "Choose your state", leadingIcon: Icon(Icons.map, color: AppColors.inactiveGrey), suffixIcon: Icon(CupertinoIcons.chevron_down, size: 15)),
                        SmivoxInputFields(headText: AppTexts.city, labelColor: Colors.black, hintText: "Choose your city", leadingIcon: Icon(Icons.map, color: AppColors.inactiveGrey), suffixIcon: Icon(CupertinoIcons.chevron_down, size: 15)),
                        SmivoxInputFields(headText: AppTexts.natureOfBusiness, labelColor: Colors.black, hintText: "Choose nature of business", leadingIcon: Icon(Icons.map, color: AppColors.inactiveGrey), suffixIcon: Icon(CupertinoIcons.chevron_down, size: 15)),

                        SizedBox(height: 10),
                        Row(
                          spacing: 5,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CommonMethods.appTexts(context, "Already have a ${AppTexts.companyName} account?", fontSize: 14),
                            GestureDetector(
                              onTap: () => CommonMethods.replaceWithNextScreen(context, RoutesPath.companyLoginScreen),
                              child: CommonMethods.appTexts(context, "Log in", color: Color(0xFF0311D7), fontWeight: FontWeight.w500),

                            )
                          ],
                        ),
                        SmivoxButton(
                            text: "Continue",
                            onTap: () => CommonMethods.replaceWithNextScreen(context, RoutesPath.personalDetailsScreen),
                        ),

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



