import 'package:flutter/material.dart';

class TextFieldClass {
  static TextFormField buildTextFormField({
    String? labelText,
    String? hintText,
    String? Function(String?)? validator,
    void Function(String)? onChanged,
    Widget? prefixIcon,
    Widget? suffixIcon,
    bool obscureText = false,
    Color? borderColor,
    TextStyle? textStyle ,
    TextStyle? hintStyle,
    int maxLines = 1,
    double radius = 4,
    bool? enabled,
    String? intialValue,
    TextEditingController? controller,




  }) {
    return TextFormField(
      controller: controller,
      enabled: enabled,
      initialValue: intialValue,
      maxLines: maxLines,
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
          borderSide: BorderSide(color: borderColor ?? Colors.white),
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


