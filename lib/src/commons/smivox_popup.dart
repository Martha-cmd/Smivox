import 'package:flutter/material.dart';
import 'package:smivox_inventory_software/src/commons/smivox_button.dart';

class ReusablePopup extends StatelessWidget {
  final String title;
  final Widget content;
  final String actionText;
  final VoidCallback? onActionPressed;
  final bool showCloseIcon;

  const ReusablePopup({
    super.key,
    required this.title,
    required this.content,
    this.actionText = '',
    this.onActionPressed,
    this.showCloseIcon = true,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  if (showCloseIcon)
                    IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                ],
              ),
              const SizedBox(height: 10),
              content, // Any widget you want passed in
              if (actionText.isNotEmpty) ...[
                const SizedBox(height: 20),
                SmivoxButton(),
              ]
            ],
          ),
        ),
      ),
    );
  }
}
