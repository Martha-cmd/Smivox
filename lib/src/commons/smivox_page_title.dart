import 'package:flutter/material.dart';
import 'common_methods.dart';

class SmivoxPageTitle extends StatelessWidget {
  final String pageTitle;
  final IconData? pageIcon;
  final double? pageIconSize;
  final Color? pageIconColor;
  final VoidCallback? iconAction;

  SmivoxPageTitle({super.key, required this.pageTitle, this.pageIcon, this.pageIconColor, this.iconAction, this.pageIconSize});

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
        GestureDetector(
           onTap: iconAction,
            child: Icon(pageIcon, color: pageIconColor, size: pageIconSize,))
      ],
    );
  }
}
