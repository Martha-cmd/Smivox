import 'package:flutter/material.dart';
import '../../../../commons/app_colors.dart';
import '../../../../commons/smivox_input_fields.dart';


class SettingsCustomInput extends StatelessWidget {
  final String headText;
  final Color? headTextColor;
  final String? hintText;
  final TextStyle? hintStyle;
  final Color? borderColor;
  final Color? fillColor;

  const SettingsCustomInput({super.key, required this.headText, this.headTextColor, this.hintText, this.hintStyle, this.borderColor, this.fillColor});

  @override
  Widget build(BuildContext context) {
    return SmivoxInputFields(
      headText: headText,
      headTextColor: headTextColor ?? AppColors.inactiveGrey,
      headFontWeight: FontWeight.normal,
      hintText: hintText,
      hintStyle: hintStyle ?? TextStyle(
        color: Colors.black,
      ),
      focusedBorderColor: borderColor ?? Colors.transparent,
      borderColor: borderColor ?? Colors.transparent,
      fillColor: fillColor ?? Color(0xFFC2C2C2).withOpacity(0.3),
    );
  }
}
