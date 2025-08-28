import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smivox_inventory_software/src/commons/app_colors.dart';
import 'package:smivox_inventory_software/src/commons/common_methods.dart';
import '../res/theme/theme.dart';

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
  });

  @override
  State<SmivoxInputFields> createState() => _SmivoxInputFieldsState();
}

class _SmivoxInputFieldsState extends State<SmivoxInputFields> {
  @override
  Widget build(BuildContext context) {
    final borderColor = widget.borderColor ?? AppColors.lightGrey;
    final focusedBorderColor = widget.focusedBorderColor ?? Colors.grey;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 8,
      children: [
        if (widget.headText != null && widget.headText!.isNotEmpty)
          CommonMethods.appTexts(
            context,
            widget.headText!,
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: AppColors.darkGrey,
          ),
        Focus(
          onFocusChange: widget.onFocusChange,
          child: Container(
            constraints: BoxConstraints(
               maxHeight: 44,
            ),
            decoration: BoxDecoration(
              color: widget.fillColor ?? Colors.transparent,
              borderRadius: BorderRadius.circular(widget.borderRadius ?? 10),
              border: Border.all(
                color: borderColor,
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
                  child: TextFormField(
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
                          const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
                      isDense: widget.isDense,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(widget.borderRadius ?? 10.0),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(widget.borderRadius ?? 10.0),
                        borderSide: BorderSide(
                          color: focusedBorderColor,
                          width: 1.0,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(widget.borderRadius ?? 10.0),
                        borderSide: BorderSide.none,
                      ),
                      suffixIcon: widget.suffixIcon != null
                          ? Padding(
                        padding: const EdgeInsets.only(right: 12),
                        child: widget.suffixIcon,
                      )
                          : null,
                      prefixIcon: widget.prefixIcon,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}