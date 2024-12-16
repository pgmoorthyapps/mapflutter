import 'package:flutter/services.dart';

// import '../constants/constants.dart';
import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

class TextBoxWidget extends StatelessWidget {
  TextBoxWidget({
    super.key,
    this.title,
    this.width,
    this.margin,
    this.labelText,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText,
    this.type,
    this.inputType,
    this.control,
    this.errMsg,
    this.onChanged,
    this.validator,
    this.readOnly,
    this.focusNode,
    this.inputFormaters,
    this.initialValue,
    this.lines,
    this.textCapitalization,
    this.borderColor,
    this.focusBorderColor,
    this.labelColor,
    this.borderRadius,
    this.onTap,
    this.textAlign,
  });
  TextAlign? textAlign;

  final String? title;
  final double? width;
  final String? labelText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  var margin;
  var control;
  var initialValue;
  var type;
  String? inputType;
  var errMsg;
  var obscureText;
  var onChanged;
  var validator;
  final bool? readOnly;
  var focusNode;
  var inputFormaters;
  int? lines;
  final Function()? onTap;

  Color? borderColor;
  Color? focusBorderColor;
  Color? labelColor;
  BorderRadius? borderRadius;

  TextCapitalization? textCapitalization;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? const EdgeInsets.symmetric(horizontal: 4, vertical: 10),
      width: width ?? MediaQuery.of(context).size.width -20.0,
      child: TextFormField(
        onTap: onTap,
        initialValue: initialValue,
        textAlign: inputType == 'number'
            ? textAlign == null
                ? TextAlign.end
                : TextAlign.start
            : textAlign ?? TextAlign.start,
        controller: control,
        obscureText: obscureText == true
            ? obscureText
                ? true
                : false
            : false,
        keyboardType: inputType == 'number'
            ? const TextInputType.numberWithOptions()
            : type,
        inputFormatters: inputType == 'number'
            ? [
                FilteringTextInputFormatter.allow(
                    RegExp(r'^-?(\d+)?\.?\d{0,11}'))
              ]
            : inputFormaters,
        maxLines: lines ?? 1,
        validator: validator,
        readOnly: readOnly ?? false,
        onChanged: onChanged,
        focusNode: focusNode,
        cursorColor: labelColor ?? AppColors.primary,
        textCapitalization: textCapitalization ?? TextCapitalization.none,
        decoration: InputDecoration(
          hintText: title,
          labelText: labelText,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          iconColor: AppColors.primary,
          floatingLabelStyle:
              const TextStyle(fontSize: 16, color: AppColors.primary),
          hintStyle: const TextStyle(fontSize: 16, color: AppColors.lightGrey),
          labelStyle: const TextStyle(fontSize: 16, color: AppColors.lightGrey),
          border: OutlineInputBorder(
            borderSide: BorderSide(
                width: 1.5, color: borderColor ?? AppColors.lightGrey),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                width: 1.5, color: borderColor ?? AppColors.lightGrey),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
                width: 1.5, color: focusBorderColor ?? AppColors.primary),
          ),
        ),
        // )
      ),
    );
  }
}
