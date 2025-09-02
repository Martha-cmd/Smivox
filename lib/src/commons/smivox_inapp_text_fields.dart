import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smivox_inventory_software/src/commons/smivox_input_fields.dart';
import 'app_colors.dart';


class SmivoxInappTextFields extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final bool hasQuestionMark;
  final String tooltip;
  final String hintText;
  final Color hintColor;
  final bool isRequired;
  final EdgeInsetsGeometry padding;

  const SmivoxInappTextFields({
    super.key,
    required this.label,
    required this.controller,
    this.keyboardType = TextInputType.text,
    this.hasQuestionMark = false,
    this.tooltip = '',
    this.hintText = '',
    this.isRequired = false,
    this.hintColor = AppColors.inactiveGrey,
    this.padding = const EdgeInsets.symmetric(vertical: 14, horizontal: 20.0),
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                label,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: AppColors.darkGrey,
                  fontFamily: "Poppins",
                ),
              ),
              if (isRequired)
                Text(
                  "*",
                  style: TextStyle(
                    color: AppColors.primary,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Poppins",
                  ),
                ),
              const SizedBox(width: 4),
              if (hasQuestionMark)
                Tooltip(
                  margin: const EdgeInsets.symmetric(horizontal: 40),
                  showDuration: const Duration(seconds: 30),
                  message: tooltip,
                  triggerMode: TooltipTriggerMode.tap,
                  child: Icon(
                    CupertinoIcons.question_circle,
                    size: 18,
                    color: AppColors.darkGrey,
                  ),
                ),
            ],
          ),
          const SizedBox(height: 8),
          SmivoxInputFields(
            controller: controller,
            hintText: hintText,
            hintStyle: TextStyle(fontSize: 14, color: hintColor),
            // keyboardType: keyboardType,
          ),
        ],
      ),
    );
  }
}