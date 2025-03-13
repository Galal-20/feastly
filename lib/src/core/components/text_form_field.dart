import 'package:feastly/src/core/utils/size_config.dart';
import 'package:flutter/material.dart';

class TextFieldClass {
  static TextFormField buildTextFormField({
    double? radius,

    String? labelText,
    String? hintText,
    String? Function(String?)? validator,
    void Function(String)? onChanged,
    Widget? prefixIcon,
    Widget? suffixIcon,
    bool obscureText = false,
    Color ? borderColor,
  }) {
    // ignore: prefer_if_null_operators
    radius == null ? 4 : radius;



class TextFieldClass {
  static TextFormField buildTextFormField({
    double radius = 4, // Default value
    String? labelText,
    String? hintText,
    String? Function(String?)? validator,
    void Function(String)? onChanged,
    Widget? prefixIcon,
    Widget? suffixIcon,
    bool obscureText = false,
    Color? borderColor,
    TextStyle? textStyle ,
    TextStyle? hintStyle


  }) {
    return TextFormField(
      onChanged: onChanged,
      obscureText: obscureText,
      style:  textStyle,
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        labelText: labelText,
        hintText: hintText,
        hintStyle: hintStyle,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(radius)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius),
          borderSide: BorderSide(color: borderColor ?? Colors.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius),
          borderSide: BorderSide(
              color: borderColor ?? Colors.white, width: 2.0),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
        floatingLabelStyle: const TextStyle(color: Colors.white),
      ),
      validator: validator,
    );
  }
}
