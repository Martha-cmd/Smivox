import 'package:flutter/material.dart';
import 'common_methods.dart';

class SmivoxPageTitle extends StatelessWidget {
  final String pageTitle;
  final IconData? pageIcon;

  SmivoxPageTitle({super.key, required this.pageTitle, this.pageIcon});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CommonMethods.appTexts(
            context,
            pageTitle,
            fontSize: 18,
            fontWeight: FontWeight.w600
        ),
        Icon(pageIcon)
      ],
    );
  }
}
