import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'common_methods.dart';

class SmivoxPageTitle extends StatelessWidget {
  final String pageTitle;
  final Widget? pageIcon;
  final double? pageIconSize;
  final Color? pageIconColor;
  final VoidCallback? iconAction;

  SmivoxPageTitle({super.key, required this.pageTitle, this.pageIcon, this.pageIconColor, this.iconAction, this.pageIconSize});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Row(
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
              child: Container(
                  width: pageIconSize ?? 24, // Constrain the width
                  height: pageIconSize ?? 24,
                  child: pageIcon,
              )
          )
        ],
      ),
    );
  }
}
