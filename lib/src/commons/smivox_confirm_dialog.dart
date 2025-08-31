import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smivox_inventory_software/src/commons/app_colors.dart';
import 'package:smivox_inventory_software/src/commons/common_methods.dart';
import 'package:smivox_inventory_software/src/commons/smivox_button.dart';
import 'package:smivox_inventory_software/src/commons/smivox_page_title.dart';

class SmivoxConfirmDialog extends StatelessWidget {
  final String btn1text;
  final String btn2text;
  final Color? btn1Color;
  final Color? btn2Color;
  final Color? btn1TextColor;
  final Color? btn2TextColor;
  final VoidCallback? btn1OnTap;
  final VoidCallback? btn2OnTap;
  final String headText;
  final String subText;

  const SmivoxConfirmDialog({
    super.key,
    required this.btn1text,
    required this.btn2text,
    this.btn1Color,
    this.btn2Color,
    this.btn1TextColor,
    this.btn2TextColor,
    this.btn2OnTap,
    this.btn1OnTap,
    required this.headText,
    required this.subText,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: 16.0,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      backgroundColor: Colors.white,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height * 0.3,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric( horizontal: 20.0, vertical: 10.0,),
          child: Column(
            spacing: 14,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              SmivoxPageTitle(
                pageTitle: "",
                pageIcon: CupertinoIcons.clear_circled_solid,
                pageIconSize: 20,
                pageIconColor: AppColors.inactiveInput,
                iconAction: () => Navigator.pop(context),
              ),
              CommonMethods.appTexts(
                  context,
                  headText,
                 fontSize: 16,
                 fontWeight: FontWeight.w600,
                textAlign: TextAlign.center
              ),
              CommonMethods.appTexts(
                  context,
                  subText,
                 fontSize: 16,
                 color: AppColors.darkGrey,
                textAlign: TextAlign.center
              ),
              const SizedBox(height: 20),
              Row(
                spacing: 14,
                children: [
                  Expanded(child: SmivoxButton(text: btn1text, color: btn1Color, textColor: btn1TextColor, onTap: () => Navigator.pop(context))),
                  Expanded(child: SmivoxButton(text: btn2text, color: btn2Color, onTap: () => Navigator.pop(context))),
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}
