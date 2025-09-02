import 'package:flutter/material.dart';
import 'package:smivox_inventory_software/src/commons/smivox_button.dart';


class SmivoxFooterButton extends StatelessWidget {
  final String? btnText;
  final VoidCallback? onTap;
  final Widget? widget;

  const SmivoxFooterButton({super.key, this.btnText, this.onTap, this.widget});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: widget ?? SmivoxButton(text: btnText, onTap: onTap),
    );
  }
}
