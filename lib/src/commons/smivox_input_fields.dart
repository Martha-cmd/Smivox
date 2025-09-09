// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:smivox_inventory_software/src/commons/app_colors.dart';
// import 'package:smivox_inventory_software/src/commons/common_methods.dart';
// import '../res/theme/theme.dart';
//
// class SmivoxInputFields extends StatefulWidget {
//   final TextEditingController? controller;
//   final TextInputAction? keyboardType;
//   final TextCapitalization? textCapitalization;
//   final TextInputType? textInputType;
//   final bool? obscureText;
//   final bool? isDense;
//   final String? hintText;
//   final String? labelText;
//   final String? headText;
//   final Color? headTextColor;
//   final FontWeight? headFontWeight;
//   final Function(String)? onChanged;
//   final Function(String)? onSubmitted;
//   final FormFieldValidator<String>? validator;
//   final Widget? prefixIcon;
//   final Widget? leadingIcon;
//   final Widget? suffixIcon;
//   final bool? filled;
//   final bool? enabled;
//   final int? maxLines;
//   final bool readOnly;
//   final Color? labelColor;
//   final Function()? onTap;
//   final Color? borderColor;
//   final Color? focusedBorderColor;
//   final Color? fillColor;
//   final List<TextInputFormatter>? inputFormatter;
//   final FocusNode? focusNode;
//   final String? initialValue;
//   final EdgeInsetsGeometry? contentPadding;
//   final double? borderRadius;
//   final TextStyle? textStyle;
//   final TextStyle? hintStyle;
//   final void Function(bool)? onFocusChange;
//   final List<TextInputFormatter>? inputFormatters;
//   final TextAlign? textAlign;
//   final AutovalidateMode? autovalidateMode;
//
//   const SmivoxInputFields({
//     super.key,
//     this.controller,
//     this.keyboardType,
//     this.enabled,
//     this.textCapitalization,
//     this.textInputType,
//     this.obscureText,
//     this.isDense,
//     this.hintText,
//     this.labelText,
//     this.headText,
//     this.headTextColor,
//     this.headFontWeight,
//     this.onChanged,
//     this.onFocusChange,
//     this.onSubmitted,
//     this.validator,
//     this.prefixIcon,
//     this.leadingIcon,
//     this.suffixIcon,
//     this.filled = true,
//     this.fillColor,
//     this.inputFormatter,
//     this.maxLines = 1,
//     this.initialValue,
//     this.readOnly = false,
//     this.onTap,
//     this.labelColor,
//     this.focusNode,
//     this.contentPadding,
//     this.borderRadius = 10.0,
//     this.textStyle,
//     this.hintStyle,
//     this.textAlign,
//     this.autovalidateMode,
//     this.inputFormatters,
//     this.borderColor,
//     this.focusedBorderColor,
//   });
//
//   @override
//   State<SmivoxInputFields> createState() => _SmivoxInputFieldsState();
// }
//
// class _SmivoxInputFieldsState extends State<SmivoxInputFields> {
//   bool _isFocused = false;
//
//
//   @override
//   Widget build(BuildContext context) {
//     final borderColor = widget.borderColor ?? AppColors.lightGrey;
//     final focusedBorderColor = widget.focusedBorderColor ?? Colors.grey;
//     final headTextColor = widget.headTextColor ?? AppColors.darkGrey;
//
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       spacing: 8,
//       children: [
//         if (widget.headText != null && widget.headText!.isNotEmpty)
//           CommonMethods.appTexts(
//             context,
//             widget.headText!,
//             fontSize: 16,
//             fontWeight: widget.headFontWeight ?? FontWeight.w500,
//             color: headTextColor
//           ),
//         Focus(
//           onFocusChange: widget.onFocusChange,
//           child: Container(
//             constraints: BoxConstraints(
//                maxHeight: 44,
//             ),
//             decoration: BoxDecoration(
//               color: widget.fillColor ?? Colors.transparent,
//               borderRadius: BorderRadius.circular(widget.borderRadius ?? 10),
//               border: Border.all(
//                 color: borderColor,
//                 width: 1.0,
//               ),
//             ),
//             child: Row(
//               children: [
//                 if (widget.leadingIcon != null)
//                   Padding(
//                     padding: const EdgeInsets.only(left: 12.0),
//                     child: widget.leadingIcon,
//                   ),
//                 Expanded(
//                   child: TextFormField(
//                     initialValue: widget.initialValue,
//                     controller: widget.controller,
//                     enabled: widget.enabled,
//                     textAlign: widget.textAlign ?? TextAlign.start,
//                     autovalidateMode: widget.autovalidateMode,
//                     showCursor: true,
//                     focusNode: widget.focusNode,
//                     style: widget.textStyle ??
//                         TextStyle(
//                           color: AppTheme.getTextColor(context),
//                           fontSize: 16,
//                           fontWeight: FontWeight.w400,
//                           fontFamily: "Poppins",
//                         ),
//                     onTap: widget.onTap,
//                     onFieldSubmitted: widget.onSubmitted,
//                     autocorrect: false,
//                     autofocus: false,
//                     maxLines: widget.maxLines,
//                     readOnly: widget.readOnly,
//                     inputFormatters: widget.inputFormatters,
//                     keyboardType: widget.textInputType ?? TextInputType.text,
//                     textCapitalization: widget.textCapitalization ?? TextCapitalization.none,
//                     textInputAction: widget.keyboardType ?? TextInputAction.done,
//                     validator: widget.validator,
//                     textAlignVertical: TextAlignVertical.center,
//                     obscureText: widget.obscureText ?? false,
//                     obscuringCharacter: '•',
//                     onChanged: (value) {
//                       debugPrint('onChanged called: $value, Stack: ${StackTrace.current}');
//                       if (widget.onChanged != null) widget.onChanged!(value);
//                     },
//                     decoration: InputDecoration(
//                       fillColor: Colors.transparent,
//                       filled: widget.filled,
//                       hintText: widget.hintText,
//                       hintStyle: widget.hintStyle ??
//                           TextStyle(
//                             color: AppColors.inactiveGrey,
//                             fontSize: 15,
//                           ),
//                       contentPadding: widget.contentPadding ??
//                           EdgeInsets.symmetric(vertical: 12, horizontal: 12),
//                       isDense: widget.isDense,
//                       border: InputBorder.none, // Remove all internal borders
//                       focusedBorder: InputBorder.none, // Remove focused border
//                       enabledBorder: InputBorder.none, // Remove enabled border
//                       errorBorder: InputBorder.none, // Remove error border
//                       disabledBorder: InputBorder.none, // Remove disabled border
//                       focusedErrorBorder: InputBorder.none,
//                       suffixIcon: widget.suffixIcon != null
//                           ? Padding(
//                         padding: const EdgeInsets.only(right: 12),
//                         child: widget.suffixIcon,
//                       )
//                           : null,
//                       prefixIcon: widget.prefixIcon,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smivox_inventory_software/src/commons/app_colors.dart';
import 'package:smivox_inventory_software/src/commons/common_methods.dart';
import '../res/theme/theme.dart';
import 'package:flutter/cupertino.dart';

class SmivoxInputFields extends StatefulWidget {
  final TextEditingController? controller;
  final TextInputAction? keyboardType;
  final TextCapitalization? textCapitalization;
  final TextInputType? textInputType;
  final bool? obscureText;
  final bool? isDense;
  final String? hintText;
  final String? labelText;
  final String? headText;
  final Color? headTextColor;
  final FontWeight? headFontWeight;
  final Function(String)? onChanged;
  final Function(String)? onSubmitted;
  final FormFieldValidator<String>? validator;
  final Widget? prefixIcon;
  final Widget? leadingIcon;
  final Widget? suffixIcon;
  final bool? filled;
  final bool? enabled;
  final int? maxLines;
  final bool readOnly;
  final Color? labelColor;
  final Function()? onTap;
  final Color? borderColor;
  final Color? focusedBorderColor;
  final Color? fillColor;
  final List<TextInputFormatter>? inputFormatter;
  final FocusNode? focusNode;
  final String? initialValue;
  final EdgeInsetsGeometry? contentPadding;
  final double? borderRadius;
  final TextStyle? textStyle;
  final TextStyle? hintStyle;
  final void Function(bool)? onFocusChange;
  final List<TextInputFormatter>? inputFormatters;
  final TextAlign? textAlign;
  final AutovalidateMode? autovalidateMode;

  final bool isDropdown;
  final List<String>? dropdownItems;
  final Function(String)? onDropdownItemSelected;
  final Widget? dropdownSuffixIcon;
  final Widget? dropdownPrefixIcon;


  const SmivoxInputFields({
    super.key,
    this.controller,
    this.keyboardType,
    this.enabled,
    this.textCapitalization,
    this.textInputType,
    this.obscureText,
    this.isDense,
    this.hintText,
    this.labelText,
    this.headText,
    this.headTextColor,
    this.headFontWeight,
    this.onChanged,
    this.onFocusChange,
    this.onSubmitted,
    this.validator,
    this.prefixIcon,
    this.leadingIcon,
    this.suffixIcon,
    this.filled = true,
    this.fillColor,
    this.inputFormatter,
    this.maxLines = 1,
    this.initialValue,
    this.readOnly = false,
    this.onTap,
    this.labelColor,
    this.focusNode,
    this.contentPadding,
    this.borderRadius = 10.0,
    this.textStyle,
    this.hintStyle,
    this.textAlign,
    this.autovalidateMode,
    this.inputFormatters,
    this.borderColor,
    this.focusedBorderColor,

    // New parameters for dropdown
    this.isDropdown = false,
    this.dropdownItems,
    this.onDropdownItemSelected,
    this.dropdownSuffixIcon,
    this.dropdownPrefixIcon,
  });

  @override
  State<SmivoxInputFields> createState() => _SmivoxInputFieldsState();
}

class _SmivoxInputFieldsState extends State<SmivoxInputFields> {
  bool _isFocused = false;
  OverlayEntry? _overlayEntry;
  final LayerLink _layerLink = LayerLink();
  final FocusNode _focusNode = FocusNode();
  final TextEditingController _dropdownController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {
        _isFocused = _focusNode.hasFocus;
      });

      if (widget.isDropdown && _focusNode.hasFocus) {
        _showDropdownOverlay();
      } else {
        _removeDropdownOverlay();
      }
    });

    if (widget.initialValue != null) {
      _dropdownController.text = widget.initialValue!;
    }
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _dropdownController.dispose();
    _removeDropdownOverlay();
    super.dispose();
  }

  // void _showDropdownOverlay() {
  //   if (widget.dropdownItems == null || widget.dropdownItems!.isEmpty) return;
  //
  //   _removeDropdownOverlay();
  //
  //   final renderBox = context.findRenderObject() as RenderBox;
  //   final size = renderBox.size;
  //
  //   _overlayEntry = OverlayEntry(
  //     builder: (context) => Positioned(
  //       width: size.width,
  //       child: CompositedTransformFollower(
  //         link: _layerLink,
  //         showWhenUnlinked: false,
  //         offset: Offset(-31, size.height - 34),
  //         child: Material(
  //           elevation: 2,
  //           child: Container(
  //             constraints: BoxConstraints(
  //               maxHeight: 400,
  //             ),
  //             decoration: BoxDecoration(
  //               color: Colors.white,
  //               // borderRadius: BorderRadius.only(
  //               //   bottomLeft: Radius.circular(widget.borderRadius ?? 10),
  //               //   bottomRight: Radius.circular(widget.borderRadius ?? 10),
  //               // ),
  //               borderRadius: BorderRadius.circular(20),
  //               boxShadow: [
  //                 BoxShadow(
  //                   color: Colors.black12,
  //                   blurRadius: 4,
  //                   offset: Offset(0, 2),
  //                 ),
  //               ],
  //             ),
  //             child: ListView.builder(
  //               padding: EdgeInsets.zero,
  //               shrinkWrap: true,
  //               itemCount: widget.dropdownItems!.length,
  //               itemBuilder: (context, index) {
  //                 final item = widget.dropdownItems![index];
  //                 return InkWell(
  //                   onTap: () {
  //                     _dropdownController.text = item;
  //                     if (widget.onDropdownItemSelected != null) {
  //                       widget.onDropdownItemSelected!(item);
  //                     }
  //                     if (widget.onChanged != null) {
  //                       widget.onChanged!(item);
  //                     }
  //                     _focusNode.unfocus();
  //                   },
  //                   child: Container(
  //                     padding: EdgeInsets.symmetric(vertical: 10, horizontal: 24),
  //                     color: Colors.transparent,
  //                     // decoration: BoxDecoration(
  //                     //   border: index < widget.dropdownItems!.length - 1
  //                     //       ? Border(
  //                     //     bottom: BorderSide(
  //                     //       color: AppColors.lightGrey.withOpacity(0.5),
  //                     //       width: 0.5,
  //                     //     ),
  //                     //   )
  //                     //       : null,
  //                     // ),
  //                     child: Text(
  //                       item,
  //                       style: widget.textStyle ??
  //                           TextStyle(
  //                             color: AppTheme.getTextColor(context),
  //                             fontSize: 16,
  //                             fontWeight: FontWeight.w400,
  //                             fontFamily: "Poppins",
  //                           ),
  //                     ),
  //                   ),
  //                 );
  //               },
  //             ),
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  //
  //   Overlay.of(context).insert(_overlayEntry!);
  // }
  void _showDropdownOverlay() {
    if (widget.dropdownItems == null || widget.dropdownItems!.isEmpty) return;

    _removeDropdownOverlay();

    final renderBox = context.findRenderObject() as RenderBox;
    final size = renderBox.size;

    _overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        width: size.width,
        child: CompositedTransformFollower(
          link: _layerLink,
          showWhenUnlinked: false,
          offset: Offset(-31, size.height - 34),
          child: Material(
            elevation: 2,
            child: Container(
              constraints: BoxConstraints(
                maxHeight: 200,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                // borderRadius: BorderRadius.only(
                //   bottomLeft: Radius.circular(widget.borderRadius ?? 10),
                //   bottomRight: Radius.circular(widget.borderRadius ?? 10),
                // ),
                // border: Border.all(
                //   color: _isFocused
                //       ? (widget.focusedBorderColor ?? Colors.grey)
                //       : (widget.borderColor ?? AppColors.lightGrey),
                //   width: 1.0,
                // ),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 4,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: ListView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                itemCount: widget.dropdownItems!.length,
                itemBuilder: (context, index) {
                  final item = widget.dropdownItems![index];
                  return InkWell(
                    onTap: () {
                      _dropdownController.text = item;
                      if (widget.onDropdownItemSelected != null) {
                        widget.onDropdownItemSelected!(item);
                      }
                      if (widget.onChanged != null) {
                        widget.onChanged!(item);
                      }
                      _focusNode.unfocus();
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 16),
                      decoration: BoxDecoration(
                        border: index < widget.dropdownItems!.length - 1
                            ? Border(
                          bottom: BorderSide(
                            color: AppColors.lightGrey.withOpacity(0.5),
                            width: 0.5,
                          ),
                        )
                            : null,
                      ),
                      child: Text(
                        item,
                        style: widget.textStyle ??
                            TextStyle(
                              color: AppTheme.getTextColor(context),
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              fontFamily: "Poppins",
                            ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );

    Overlay.of(context).insert(_overlayEntry!);
  }

  void _removeDropdownOverlay() {
    if (_overlayEntry != null) {
      _overlayEntry!.remove();
      _overlayEntry = null;
    }
  }

  Widget _buildDropdownField() {
    return CompositedTransformTarget(
      link: _layerLink,
      child: TextFormField(
        controller: _dropdownController,
        focusNode: _focusNode,
        readOnly: true,
        enabled: widget.enabled,
        textAlign: widget.textAlign ?? TextAlign.start,
        style: widget.textStyle ??
            TextStyle(
              color: AppTheme.getTextColor(context),
              fontSize: 16,
              fontWeight: FontWeight.w400,
              fontFamily: "Poppins",
            ),
        onTap: () {
          if (widget.onTap != null) widget.onTap!();
          if (widget.isDropdown) {
            if (_focusNode.hasFocus) {
              _focusNode.unfocus();
            } else {
              _focusNode.requestFocus();
            }
          }
        },
        decoration: InputDecoration(
          fillColor: Colors.transparent,
          filled: widget.filled,
          hintText: widget.hintText,
          hintStyle: widget.hintStyle ??
              TextStyle(
                color: AppColors.inactiveGrey,
                fontSize: 15,
              ),
          contentPadding: widget.contentPadding ??
              EdgeInsets.symmetric(vertical: 12, horizontal: 12),
          isDense: widget.isDense ?? true,
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          focusedErrorBorder: InputBorder.none,
          suffixIcon: widget.dropdownSuffixIcon ??
              (widget.isDropdown
                  ? Padding(
                padding: EdgeInsets.only(right: 12),
                child: Icon(
                  _isFocused ? CupertinoIcons.chevron_up : CupertinoIcons.chevron_down,
                  size: 16,
                  color: Colors.grey[600],
                ),
              )
                  : widget.suffixIcon),
          prefixIcon: widget.dropdownPrefixIcon ?? widget.prefixIcon,
        ),
      ),
    );
  }

  Widget _buildRegularTextField() {
    return TextFormField(
      initialValue: widget.initialValue,
      controller: widget.controller,
      enabled: widget.enabled,
      textAlign: widget.textAlign ?? TextAlign.start,
      autovalidateMode: widget.autovalidateMode,
      showCursor: true,
      focusNode: widget.focusNode,
      style: widget.textStyle ??
          TextStyle(
            color: AppTheme.getTextColor(context),
            fontSize: 16,
            fontWeight: FontWeight.w400,
            fontFamily: "Poppins",
          ),
      onTap: widget.onTap,
      onFieldSubmitted: widget.onSubmitted,
      autocorrect: false,
      autofocus: false,
      maxLines: widget.maxLines,
      readOnly: widget.readOnly,
      inputFormatters: widget.inputFormatters,
      keyboardType: widget.textInputType ?? TextInputType.text,
      textCapitalization: widget.textCapitalization ?? TextCapitalization.none,
      textInputAction: widget.keyboardType ?? TextInputAction.done,
      validator: widget.validator,
      textAlignVertical: TextAlignVertical.center,
      obscureText: widget.obscureText ?? false,
      obscuringCharacter: '•',
      onChanged: (value) {
        debugPrint('onChanged called: $value, Stack: ${StackTrace.current}');
        if (widget.onChanged != null) widget.onChanged!(value);
      },
      decoration: InputDecoration(
        fillColor: Colors.transparent,
        filled: widget.filled,
        hintText: widget.hintText,
        hintStyle: widget.hintStyle ??
            TextStyle(
              color: AppColors.inactiveGrey,
              fontSize: 15,
            ),
        contentPadding: widget.contentPadding ??
            EdgeInsets.symmetric(vertical: 12, horizontal: 12),
        isDense: widget.isDense ?? true,
        border: InputBorder.none,
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
        focusedErrorBorder: InputBorder.none,
        suffixIcon: widget.suffixIcon != null
            ? Padding(
          padding: const EdgeInsets.only(right: 12),
          child: widget.suffixIcon,
        )
            : null,
        prefixIcon: widget.prefixIcon,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final borderColor = widget.borderColor ?? AppColors.lightGrey;
    final focusedBorderColor = widget.focusedBorderColor ?? Colors.grey;
    final headTextColor = widget.headTextColor ?? AppColors.darkGrey;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.headText != null && widget.headText!.isNotEmpty)
          CommonMethods.appTexts(
              context,
              widget.headText!,
              fontSize: 16,
              fontWeight: widget.headFontWeight ?? FontWeight.w500,
              color: headTextColor
          ),
        if (widget.headText != null && widget.headText!.isNotEmpty)
          const SizedBox(height: 8),
        Container(
          constraints: BoxConstraints(
            minHeight: 44,
          ),
          decoration: BoxDecoration(
            color: widget.fillColor ?? Colors.transparent,
            borderRadius: BorderRadius.circular(widget.borderRadius ?? 10),
            border: Border.all(
              color: _isFocused ? focusedBorderColor : borderColor,
              width: 1.0,
            ),
          ),
          child: Row(
            children: [
              if (widget.leadingIcon != null)
                Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: widget.leadingIcon,
                ),
              Expanded(
                child: widget.isDropdown
                    ? _buildDropdownField()
                    : _buildRegularTextField(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}


