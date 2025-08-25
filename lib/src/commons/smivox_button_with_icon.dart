import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'common_methods.dart';

class SmivoxButtonWithIcon extends StatelessWidget {
  final Widget widget;
  final String text;
  final Color? textColor;
  final double? horPad;
  final double? verPad;
  final Color? bckgrndColor;
  final Color? borderColor;

  const SmivoxButtonWithIcon({super.key,
    required this.widget, required this.text, this.horPad, this.verPad,
    this.bckgrndColor, this.borderColor, this.textColor});

  @override
  Widget build(BuildContext context) {
    return  IntrinsicWidth(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: horPad ?? 10, vertical: verPad ?? 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            border: Border.all(color: borderColor ?? AppColors.primary, width: 2),
            color: bckgrndColor ?? AppColors.primary
        ),
        child: Row(
          spacing: 5,
          children: [
            widget,
            CommonMethods.appTexts(
                context,
                text,
                color: textColor ?? Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 16
            ),
          ],
        ),
      ),
    );
  }
}
