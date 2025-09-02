import 'package:flutter/material.dart';
import '../../../../../commons/app_colors.dart';
import '../../../../../commons/common_methods.dart';



class HomePageSubheads extends StatelessWidget {
  final String subtext;
  final Widget? subWidget;

  const HomePageSubheads({super.key, required this.subtext, this.subWidget});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CommonMethods.appTexts(
          context,
          subtext,
          color: AppColors.inactiveGrey,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
        subWidget ?? const SizedBox.shrink(),
      ],
    );
  }
}


