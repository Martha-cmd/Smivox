import 'package:flutter/material.dart';
import 'package:smivox_inventory_software/src/commons/smivox_button.dart';


class SmivoxFooterButton extends StatelessWidget {
  final String? btnText;
  final VoidCallback? onTap;

  const SmivoxFooterButton({super.key, this.btnText, this.onTap});

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
      child: SmivoxButton(text: btnText, onTap: onTap),
    );
  }
}
