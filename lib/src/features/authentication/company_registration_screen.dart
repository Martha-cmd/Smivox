import 'package:flutter/material.dart';
import 'package:smivox_inventory_software/src/res/app_strings.dart';

import 'heading_and_subheading.dart';

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
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                 mainAxisAlignment: MainAxisAlignment.start,
                 spacing: 20,
                 children: [
                    Image.asset("assets/logo/logo.png", width: 100,),
                    HeadingAndSubheading(heading: AppTexts.welcomeToSmivox, subHeading: AppTexts.subtextCompanyReg,),
                 ],
              ),
            ),
          ),
        ),
    );
  }
}



