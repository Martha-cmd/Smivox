import 'package:flutter/material.dart';
import '../../../commons/app_colors.dart';

class ActiveScreen extends StatelessWidget {
  final VoidCallback? onTap;

  const ActiveScreen({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 25,
        height: 7,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: AppColors.primary,
          border: Border.all(width: 1, color: AppColors.primary),
        ),
      ),
    );
  }
}


class InActiveScreen extends StatelessWidget {
  final VoidCallback? onTap;

  const InActiveScreen({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 12,
        height: 7,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          border: Border.all(width: 0.5, color: AppColors.black),
        ),
      ),
    );
  }
}

