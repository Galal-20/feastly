
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button({
    super.key,
    required this.isLoading,
    required GlobalKey<FormState> formKey,
    required this.email,
    required this.password,
    required this.text,
    required this.onPressed


  }) : _formKey = formKey;

  final bool isLoading;
  final GlobalKey<FormState> _formKey;
  final String email;
  final String password;
  final String text;
  final void Function()? onPressed;


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 60,
      child: ElevatedButton(
        onPressed: onPressed,
        child: isLoading
            ? CircularProgressIndicator(color: Colors.black)
            : Text(text, style: TextStyle(color: Colors.black)),
      ),
    );
  }
}