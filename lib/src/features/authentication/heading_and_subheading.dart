import 'package:flutter/material.dart';
import '../../commons/app_colors.dart';
import '../../commons/common_methods.dart';


class HeadingAndSubheading extends StatelessWidget {
  final String heading;
  final String subHeading;

  const HeadingAndSubheading({super.key, required this.heading, required this.subHeading});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 0,
      children: [
        CommonMethods.appTexts(
          context,
          heading,
          fontWeight: FontWeight.w600,
          fontSize: 18,
        ),
        CommonMethods.appTexts(
          context,
          subHeading,
          fontSize: 14,
          color: AppColors.textGrey,
        ),
      ],
    );
  }
}
