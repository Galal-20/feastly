

import 'package:flutter/material.dart';


/*class TextFieldClass{
  static  TextFormField buildTextFormField(
      String labelText,
      String hintText,
      String? Function(String?)? validator,
      void Function(String)? onChanged,
      Widget? prefixIcon, {
        Widget? suffixIcon,
        bool obscureText = false,
      }) {
    return TextFormField(
      onChanged: onChanged,
      obscureText: obscureText,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        labelText: labelText,
        hintText: hintText,
        fillColor: Colors.transparent,
        hintStyle: const TextStyle(color: Colors.white),
        border: const OutlineInputBorder(),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(12),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white, width: 2.0),
          borderRadius: BorderRadius.circular(12),
        ),
        floatingLabelStyle: const TextStyle(color: Colors.white),
      ),
      validator: validator,
    );
  }
}*/

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