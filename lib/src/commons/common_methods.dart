import 'package:flutter/material.dart';
import 'package:smivox_inventory_software/src/commons/app_colors.dart';
import '../res/theme/theme.dart';

class CommonMethods {
  static void sendToNextScreen(
    BuildContext context,
    String routeName, {
    Object? arguments,
  }) {
    if (!context.mounted) return;

    if (arguments != null) {
      Navigator.pushNamed(context, routeName, arguments: arguments);
    } else {
      Navigator.pushNamed(context, routeName);
    }
  }

  static void replaceWithNextScreen(
    BuildContext context,
    String routeName, {
    Object? arguments,
  }) {
    if (!context.mounted) return;

    if (arguments != null) {
      Navigator.pushReplacementNamed(context, routeName, arguments: arguments);
    } else {
      Navigator.pushReplacementNamed(context, routeName);
    }
  }

  static void showSnackBar({
    required BuildContext context,
    required String message,
    SnackBarType type = SnackBarType.info,
    Color? backgroundColor,
    Color? textColor,
    int durationInSeconds = 3,
    SnackBarBehavior behavior = SnackBarBehavior.floating,
    EdgeInsetsGeometry? margin,
    double? elevation,
    ShapeBorder? shape,
    String? actionLabel,
    VoidCallback? onActionPressed,
    Widget? icon,
    bool showCloseIcon = false,
  }) {
    if (!context.mounted) return;

    // Determine colors based on type if not explicitly provided
    final snackBarColors = _getSnackBarColors(type);
    final bgColor = backgroundColor ?? snackBarColors.backgroundColor;
    final txtColor = textColor ?? snackBarColors.textColor;
    final defaultIcon = snackBarColors.icon;

    ScaffoldMessenger.of(context).hideCurrentSnackBar();

    final hasIcon = (icon ?? defaultIcon) != null;

    final snackBar = SnackBar(
      content: Row(
        children: [
          if (hasIcon) ...[icon ?? defaultIcon!, SizedBox(width: 12)],
          Expanded(
            child: Text(
              message,
              style: TextStyle(
                color: txtColor,
                fontSize: 14,
                fontWeight: FontWeight.w500,
                fontFamily: "Poppins",
              ),
            ),
          ),
        ],
      ),
      backgroundColor: bgColor,
      duration: Duration(seconds: durationInSeconds),
      behavior: behavior,
      margin:
          margin ??
          (behavior == SnackBarBehavior.floating ? EdgeInsets.all(16) : null),
      elevation: elevation ?? 6.0,
      shape:
          shape ??
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      action:
          actionLabel != null
              ? SnackBarAction(
                label: actionLabel,
                textColor: txtColor,
                onPressed: onActionPressed ?? () {},
              )
              : null,
      showCloseIcon: showCloseIcon,
      closeIconColor: txtColor,
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  // Helper method to get colors and icons for different snackbar types
  static _SnackBarColors _getSnackBarColors(SnackBarType type) {
    switch (type) {
      case SnackBarType.success:
        return _SnackBarColors(
          backgroundColor: Colors.green,
          textColor: Colors.white,
          icon: Icon(Icons.check_circle, color: Colors.white),
        );
      case SnackBarType.error:
        return _SnackBarColors(
          backgroundColor: Colors.red,
          textColor: Colors.white,
          icon: Icon(Icons.error, color: Colors.white),
        );
      case SnackBarType.warning:
        return _SnackBarColors(
          backgroundColor: Colors.orange,
          textColor: Colors.black,
          icon: Icon(Icons.warning, color: Colors.black),
        );
      case SnackBarType.info:
        return _SnackBarColors(
          backgroundColor: Colors.blue,
          textColor: Colors.white,
          icon: Icon(Icons.info, color: Colors.white),
        );
      default:
        return _SnackBarColors(
          backgroundColor: AppColors.primary,
          textColor: Colors.white,
          icon: null,
        );
    }
  }

  // Quick methods for common use cases
  static void showSuccess({
    required BuildContext context,
    required String message,
    int duration = 3,
  }) {
    showSnackBar(
      context: context,
      message: message,
      type: SnackBarType.success,
      durationInSeconds: duration,
    );
  }

  static void showError({
    required BuildContext context,
    required String message,
    int duration = 4,
  }) {
    showSnackBar(
      context: context,
      message: message,
      type: SnackBarType.error,
      durationInSeconds: duration,
    );
  }

  static void showWarning({
    required BuildContext context,
    required String message,
    int duration = 4,
  }) {
    showSnackBar(
      context: context,
      message: message,
      type: SnackBarType.warning,
      durationInSeconds: duration,
    );
  }

  static void showInfo({
    required BuildContext context,
    required String message,
    int duration = 3,
  }) {
    showSnackBar(
      context: context,
      message: message,
      type: SnackBarType.info,
      durationInSeconds: duration,
    );
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
      style:
          style == null
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
              : style.copyWith(fontFamily: "Poppins", decoration: decoration),
    );
  }
}

// Helper class for snackbar colors and icons
class _SnackBarColors {
  final Color backgroundColor;
  final Color textColor;
  final Widget? icon;

  _SnackBarColors({
    required this.backgroundColor,
    required this.textColor,
    this.icon,
  });
}

// Snackbar type enum
enum SnackBarType { success, error, warning, info }
