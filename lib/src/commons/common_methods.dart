import 'package:flutter/material.dart';
import '../res/theme/theme.dart';


class CommonMethods {
  static void sendToNextScreen(BuildContext context, String routeName,
      {Object? arguments}) {
    if (!context.mounted) return;

    if (arguments != null) {
      Navigator.pushNamed(context, routeName, arguments: arguments);
    } else {
      Navigator.pushNamed(context, routeName);
    }
  }

  static void replaceWithNextScreen(BuildContext context, String routeName,
      {Object? arguments}) {
    if (!context.mounted) return;

    if (arguments != null) {
      Navigator.pushReplacementNamed(context, routeName, arguments: arguments);
    } else {
      Navigator.pushReplacementNamed(context, routeName);
    }
  }

  static appTexts(
      BuildContext context,
      String text, {
        TextStyle? style,
        Color? color,
        double? fontSize,
        double? letterspacing,
        FontWeight? fontWeight,
        TextAlign? textAlign,
        int? maxLines,
        TextOverflow? overflow,
        double? height,
        TextDecoration? decoration,
        FontStyle? fontstyle,
      }) {
    return Text(
      text,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
      style: style == null
          ? TextStyle(
        color: color ?? AppTheme.getTextColor(context),
        fontWeight: fontWeight,
        fontSize: fontSize,
        height: height,
        fontFamily: "Poppins",
        decoration: decoration,
        fontStyle: fontstyle,
        letterSpacing: letterspacing,
      )
          : style.copyWith(
        fontFamily: "Poppins",
        decoration: decoration,
      ),
    );
  }
}