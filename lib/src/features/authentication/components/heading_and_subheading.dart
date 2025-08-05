import 'package:flutter/material.dart';
import '../../../commons/app_colors.dart';
import '../../../commons/common_methods.dart';


class HeadingAndSubheading extends StatelessWidget {
  final String heading;
  final String subHeading;
  final Color? subHeadingColor;
  final double? letterSpacing;
  final double? fontSize;

  const HeadingAndSubheading({super.key, required this.heading, required this.subHeading, this.letterSpacing, this.subHeadingColor, this.fontSize});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 0,
      children: [
        CommonMethods.appTexts(
          context,
          heading,
          fontWeight: FontWeight.w600,
          fontSize: 20,
          letterspacing: -0.5,
        ),
        CommonMethods.appTexts(
          context,
          subHeading,
          textAlign: TextAlign.center,
          fontSize: fontSize ?? 14,
          color: subHeadingColor ?? AppColors.textGrey,
          letterspacing: letterSpacing ?? -0.3,
        ),
      ],
    );
  }
}
