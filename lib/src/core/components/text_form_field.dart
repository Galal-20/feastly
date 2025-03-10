

import 'package:flutter/material.dart';

class TextFieldClass{
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
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        labelText: labelText,
        hintText: hintText,
        border: const OutlineInputBorder(),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white, width: 2.0),
        ),
        floatingLabelStyle: const TextStyle(color: Colors.white),
      ),
      validator: validator,
    );
  }
}