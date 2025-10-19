import 'package:flutter/material.dart';
import 'package:smivox_inventory_software/src/commons/spinner_view.dart';
import 'app_colors.dart';
import 'common_methods.dart';

class SmivoxButton extends StatelessWidget {
  final String? text;
  final Color? color;
  final bool isLoading;
  final Color? textColor;
  final VoidCallback? onTap;
  final IconData? icon;
  final bool hasIcon;
  final Color? borderColor;

  const SmivoxButton({
    super.key,
    this.text,
    this.color,
    this.isLoading = false,
    this.textColor,
    this.onTap,
    this.icon,
    this.borderColor,
    this.hasIcon = false,
  });

  @override
  Widget build(BuildContext context) {
    final isDisabled = onTap == null;
    final buttonColor = color ?? (isDisabled ? Colors.grey : AppColors.primary);
    final colorText = textColor ?? (isDisabled ? AppColors.lightGrey : AppColors.white);

    return GestureDetector(
      onTap: isLoading ? null : onTap,
      child: Container(
        height: 44,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: borderColor ?? Colors.transparent, width: 2),
          color: buttonColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 5,
          children: [
            isLoading
                ? SizedBox(height: 20, width: 20, child: const SpinnerView( color: Colors.white, bgColor: Colors.transparent,))
                : CommonMethods.appTexts(
                  context,
                  text!,
                  color: colorText,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
            if (hasIcon && icon != null)
              Icon(icon, color: Colors.white, size: 16, fill: 1.0),
              // Text(
              //   String.fromCharCode(icon!.codePoint),
              //   style: TextStyle(
              //     fontFamily: icon!.fontFamily,
              //     color: Colors.white,
              //     fontSize: 16,
              //     fontWeight: FontWeight.bold, // This actually works!
              //   ),
              // ),
          ],
        ),
      ),
    );
  }
}
