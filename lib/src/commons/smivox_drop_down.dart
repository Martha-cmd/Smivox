// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:smivox_inventory_software/src/commons/app_colors.dart';
// import 'package:smivox_inventory_software/src/commons/common_methods.dart';
//
// class SmivoxPopupDropdown extends StatefulWidget {
//   final String headText;
//   final Color? headTextColor;
//   final FontWeight? headFontWeight;
//   final String hintText;
//   final List<String> items;
//   final String? value;
//   final Function(String)? onChanged;
//   final Function(String)? onItemSelected;
//   final Widget? leadingIcon;
//   final Color? borderColor;
//   final Color? fillColor;
//   final double? borderRadius;
//   final TextStyle? hintStyle;
//
//   const SmivoxPopupDropdown({
//     super.key,
//     required this.headText,
//     required this.hintText,
//     required this.items,
//     this.value,
//     this.onChanged,
//     this.onItemSelected,
//     this.leadingIcon,
//     this.headTextColor,
//     this.headFontWeight,
//     this.borderColor,
//     this.fillColor,
//     this.borderRadius = 10.0,
//     this.hintStyle,
//   });
//
//   @override
//   State<SmivoxPopupDropdown> createState() => _SmivoxPopupDropdownState();
// }
//
// class _SmivoxPopupDropdownState extends State<SmivoxPopupDropdown> {
//   String? _selectedValue;
//
//   @override
//   void initState() {
//     super.initState();
//     _selectedValue = widget.value;
//   }
//
//   @override
//   void didUpdateWidget(covariant SmivoxPopupDropdown oldWidget) {
//     super.didUpdateWidget(oldWidget);
//     if (widget.value != oldWidget.value) {
//       setState(() {
//         _selectedValue = widget.value;
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final borderColor = this.widget.borderColor ?? AppColors.lightGrey;
//     final headTextColor = this.widget.headTextColor ?? AppColors.darkGrey;
//
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         CommonMethods.appTexts(
//           context,
//           widget.headText,
//           fontSize: 16,
//           fontWeight: widget.headFontWeight ?? FontWeight.w500,
//           color: headTextColor,
//         ),
//         const SizedBox(height: 8),
//         Container(
//           constraints: const BoxConstraints(maxHeight: 44),
//           decoration: BoxDecoration(
//             color: widget.fillColor ?? Colors.transparent,
//             borderRadius: BorderRadius.circular(widget.borderRadius ?? 20),
//             border: Border.all(color: borderColor, width: 1.0),
//           ),
//           child: InkWell(
//             onTap: () {
//               _showFullWidthPopup(context);
//             },
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
//               child: Row(
//                 children: [
//                   if (widget.leadingIcon != null) widget.leadingIcon!,
//                   if (widget.leadingIcon != null) const SizedBox(width: 12),
//                   Expanded(
//                     child: CommonMethods.appTexts(
//                       context,
//                       widget.value ?? widget.hintText,
//                       style: widget.value != null
//                           ? const TextStyle(fontSize: 16, color: Colors.black)
//                           : widget.hintStyle ?? TextStyle(
//                         color: AppColors.inactiveGrey,
//                         fontSize: 15,
//                       ),
//                       overflow: TextOverflow.ellipsis,
//                     ),
//                   ),
//                   const Icon(
//                     CupertinoIcons.chevron_down,
//                     color: AppColors.inactiveGrey,
//                     size: 15,
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
//
//   void _showFullWidthPopup(BuildContext context) {
//     final RenderBox renderBox = context.findRenderObject() as RenderBox;
//     final Offset offset = renderBox.localToGlobal(Offset.zero);
//     final double width = MediaQuery.of(context).size.width;
//     final double horizontalMargin = 20.0;
//
//     showMenu<String>(
//       context: context,
//       position: RelativeRect.fromLTRB(
//         horizontalMargin,
//         offset.dy + renderBox.size.height,
//         width - horizontalMargin,
//         offset.dy + renderBox.size.height,
//       ),
//       constraints: BoxConstraints(
//         minWidth: width - (horizontalMargin * 2),
//         maxWidth: width - (horizontalMargin * 2),
//       ),
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(8.0),
//       ),
//       color: Colors.white, // Set the background color to white
//       elevation: 4, // Add some shadow for better visibility
//       items: widget.items.map((String item) {
//         return PopupMenuItem<String>(
//           value: item,
//           height: 48,
//           child: Container(
//             width: width - (horizontalMargin * 2),
//             padding: const EdgeInsets.symmetric(horizontal: 16),
//             child: CommonMethods.appTexts(
//                 context,
//                 item,
//                 fontSize: 16,
//                 fontWeight: FontWeight.normal
//             )
//           ),
//         );
//       }).toList(),
//     ).then((String? selectedValue) {
//       if (selectedValue != null) {
//         if (widget.onChanged != null) {
//           widget.onChanged!(selectedValue);
//         }
//
//         // Call the navigation callback if provided
//         if (widget.onItemSelected != null) {
//           widget.onItemSelected!(selectedValue);
//         }
//       }
//     });
//   }
// }
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smivox_inventory_software/src/commons/app_colors.dart';
import 'package:smivox_inventory_software/src/commons/common_methods.dart';

class SmivoxPopupDropdown extends StatefulWidget {
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
  State<SmivoxPopupDropdown> createState() => _SmivoxPopupDropdownState();
}

class _SmivoxPopupDropdownState extends State<SmivoxPopupDropdown> {
  String? _selectedValue;

  @override
  void initState() {
    super.initState();
    _selectedValue = widget.value;
  }

  @override
  void didUpdateWidget(covariant SmivoxPopupDropdown oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.value != oldWidget.value) {
      setState(() {
        _selectedValue = widget.value;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final borderColor = widget.borderColor ?? AppColors.lightGrey;
    final headTextColor = widget.headTextColor ?? AppColors.darkGrey;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CommonMethods.appTexts(
          context,
          widget.headText,
          fontSize: 16,
          fontWeight: widget.headFontWeight ?? FontWeight.w500,
          color: headTextColor,
        ),
        const SizedBox(height: 8),
        Container(
          constraints: const BoxConstraints(maxHeight: 44),
          decoration: BoxDecoration(
            color: widget.fillColor ?? Colors.transparent,
            borderRadius: BorderRadius.circular(widget.borderRadius ?? 20),
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
                  if (widget.leadingIcon != null) widget.leadingIcon!,
                  if (widget.leadingIcon != null) const SizedBox(width: 12),
                  Expanded(
                    child: CommonMethods.appTexts(
                      context,
                      _selectedValue ?? widget.hintText,
                      style: _selectedValue != null
                          ? const TextStyle(fontSize: 16, color: Colors.black)
                          : widget.hintStyle ?? TextStyle(
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
      color: Colors.white,
      elevation: 4,
      items: widget.items.map((String item) {
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
        setState(() {
          _selectedValue = selectedValue;
        });

        // Call the callback functions
        if (widget.onChanged != null) {
          widget.onChanged!(selectedValue);
        }

        if (widget.onItemSelected != null) {
          widget.onItemSelected!(selectedValue);
        }
      }
    });
  }
}