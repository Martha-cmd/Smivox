import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smivox_inventory_software/src/commons/app_colors.dart';
import 'package:smivox_inventory_software/src/commons/common_methods.dart';

class SmivoxPopupDropdown extends StatelessWidget {
  final String headText;
  final Color? headTextColor;
  final FontWeight? headFontWeight;
  final String hintText;
  final List<String> items;
  final String? value;
  final Function(String)? onChanged;
  final Function(String)? onItemSelected;
  final Widget? leadingIcon;
  final Color? borderColor;
  final Color? fillColor;
  final double? borderRadius;
  final TextStyle? hintStyle;

  const SmivoxPopupDropdown({
    super.key,
    required this.headText,
    required this.hintText,
    required this.items,
    this.value,
    this.onChanged,
    this.onItemSelected,
    this.leadingIcon,
    this.headTextColor,
    this.headFontWeight,
    this.borderColor,
    this.fillColor,
    this.borderRadius = 10.0,
    this.hintStyle,
  });

  @override
  Widget build(BuildContext context) {
    final borderColor = this.borderColor ?? AppColors.lightGrey;
    final headTextColor = this.headTextColor ?? AppColors.darkGrey;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CommonMethods.appTexts(
          context,
          headText,
          fontSize: 16,
          fontWeight: headFontWeight ?? FontWeight.w500,
          color: headTextColor,
        ),
        const SizedBox(height: 8),
        Container(
          constraints: const BoxConstraints(maxHeight: 44),
          decoration: BoxDecoration(
            color: fillColor ?? Colors.transparent,
            borderRadius: BorderRadius.circular(borderRadius ?? 20),
            border: Border.all(color: borderColor, width: 1.0),
          ),
          child: InkWell(
            onTap: () {
              _showFullWidthPopup(context);
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Row(
                children: [
                  if (leadingIcon != null) leadingIcon!,
                  if (leadingIcon != null) const SizedBox(width: 12),
                  Expanded(
                    child: CommonMethods.appTexts(
                      context,
                      value ?? hintText,
                      style: value != null
                          ? const TextStyle(fontSize: 16, color: Colors.black)
                          : hintStyle ?? TextStyle(
                        color: AppColors.inactiveGrey,
                        fontSize: 15,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const Icon(
                    CupertinoIcons.chevron_down,
                    color: AppColors.inactiveGrey,
                    size: 15,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }


  void _showFullWidthPopup(BuildContext context) {
    final RenderBox renderBox = context.findRenderObject() as RenderBox;
    final Offset offset = renderBox.localToGlobal(Offset.zero);
    final double width = MediaQuery.of(context).size.width;
    final double horizontalMargin = 20.0;

    showMenu<String>(
      context: context,
      position: RelativeRect.fromLTRB(
        horizontalMargin,
        offset.dy + renderBox.size.height,
        width - horizontalMargin,
        offset.dy + renderBox.size.height,
      ),
      constraints: BoxConstraints(
        minWidth: width - (horizontalMargin * 2),
        maxWidth: width - (horizontalMargin * 2),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      color: Colors.white, // Set the background color to white
      elevation: 4, // Add some shadow for better visibility
      items: items.map((String item) {
        return PopupMenuItem<String>(
          value: item,
          height: 48,
          child: Container(
            width: width - (horizontalMargin * 2),
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: CommonMethods.appTexts(
                context,
                item,
                fontSize: 16,
                fontWeight: FontWeight.normal
            )
          ),
        );
      }).toList(),
    ).then((String? selectedValue) {
      if (selectedValue != null) {
        if (onChanged != null) {
          onChanged!(selectedValue);
        }

        // Call the navigation callback if provided
        if (onItemSelected != null) {
          onItemSelected!(selectedValue);
        }
      }
    });
  }
}