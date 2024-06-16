import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:soccer_vault/const.dart';

class AppTextFormField extends StatelessWidget {
  Widget? suffixIcon;
  Widget? prefixIcon;
  final TextEditingController? ctrl;
  TextInputAction? textInputAction;
  final String? hintText;
  double? hintsize;
  double? radius;
  EdgeInsetsGeometry? contentPadding;
  TextStyle? style;
  FloatingLabelBehavior? floatingLabelBehavior;
  //final bool floatingLabelBehavior;
  bool? obscureText;
  Color? labelColor;
  final Color? greyEnable;
  final String? labelText;
  double? labelsize;
  double? width;
  double? height;
  int? maxLength;
  bool? autofocus;
  int? maxLengthLine;
  BoxConstraints? suffixIconConstraints;
  Iterable<String>? autofillHints;
  final TextInputType? keyboardType;
  final Function()? onEditingComplete;
  String? Function(String?)? validator;
  String? Function(String?)? onChanged;
  final FocusNode? focusNode;
  final Function? onFieldSubmitted;
  final TextEditingController appController;
  final bool readOnlyColor;
  final bool? readOnlyField;
  final void Function()? onTap;
  final List<TextInputFormatter>? inputFormatterText;
  final bool? enabled;
  final bool isRequiredTextField;

  AppTextFormField({
    Key? key,
    this.radius,
    this.suffixIcon,
    this.prefixIcon,
    this.labelColor,
    this.style,
    this.isRequiredTextField = false,
    this.greyEnable,
    this.maxLengthLine,
    this.contentPadding,
    this.readOnlyField,
    this.floatingLabelBehavior,
    this.textInputAction,
    this.suffixIconConstraints,
    this.ctrl,
    //this.floatingLabelBehavior = false,
    this.onEditingComplete,
    this.autofocus,
    this.width,
    this.height,
    this.maxLength,
    this.autofillHints,
    this.hintText,
    this.hintsize,
    this.keyboardType,
    this.onFieldSubmitted,
    this.focusNode,
    this.validator,
    this.obscureText,
    required this.appController,
    this.readOnlyColor = false,
    this.onTap,
    this.onChanged,
    this.inputFormatterText,
    this.labelText,
    this.labelsize,
    this.enabled,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: TextFormField(
        maxLines: maxLengthLine,
        style: style ??
            TextStyle(
              color: readOnlyColor ? midBlackColor : darkBlackColor,
              fontWeight: FontWeight.w400,
              fontSize: MediaQuery.of(context).size.height * 0.02,
            ),
        enabled: enabled ?? true,
        autofillHints: autofillHints,
        onTap: onTap,
        onChanged: onChanged,
        inputFormatters: inputFormatterText,
        readOnly: readOnlyField ?? false,
        controller: appController,
        maxLength: maxLength,
        keyboardType: keyboardType,
        obscureText: obscureText ?? false,
        focusNode: focusNode,
        //style: TextStyle(fontWeight: FontWeight.bold),
        onFieldSubmitted: (value) => onFieldSubmitted!(value),
        onEditingComplete: onEditingComplete,
        validator: validator,

        decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            floatingLabelBehavior:
                floatingLabelBehavior ?? FloatingLabelBehavior.always,
            suffixIcon: suffixIcon,
            prefixIcon: prefixIcon,
            contentPadding: contentPadding ??
                EdgeInsets.symmetric(vertical: 19, horizontal: 10),
            hintText: hintText,
            labelText: isRequiredTextField ? "${labelText} *" : labelText,

            //label: Text(hintText.toString()),
            suffixIconConstraints: suffixIconConstraints,
            hintStyle: TextStyle(
                color: readOnlyColor ? Colors.black45 : Colors.black45,
                fontSize: hintsize ?? MediaQuery.of(context).size.height * 0.02,
                fontWeight: FontWeight.w400),
            labelStyle: TextStyle(
                color: readOnlyColor
                    ? Colors.black45
                    : labelColor ?? Colors.black45,
                fontSize:
                    labelsize ?? MediaQuery.of(context).size.height * 0.023,
                fontWeight: FontWeight.w600),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(radius ?? 45),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(radius ?? 45),
              borderSide: BorderSide(color: Colors.transparent),
            ),
            disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(radius ?? 45),
                borderSide: BorderSide(color: Colors.transparent)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(radius ?? 45),
                borderSide: BorderSide(color: Colors.transparent))),
      ),
    );
  }
}
