

import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button(
      {super.key,
      required this.isLoading,

      required GlobalKey<FormState> formKey,
      required this.email,
      required this.password,
      required this.text,
      required this.onPressed})

      GlobalKey<FormState>? formKey,
        this.email,
        this.password,
      required this.text,
      required this.onPressed, this.backgroundColor, this.style})

      : _formKey = formKey;

  final bool isLoading;
  final GlobalKey<FormState>? _formKey;
   final String? email;
   final String? password;
  final String text;
  final void Function()? onPressed;



  final Color? backgroundColor;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 60,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor:backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: isLoading
            ? CircularProgressIndicator(color: Colors.black)
            : Text(text, style:style?? TextStyle(color: Colors.black)),
      ),
    );
  }
}
