
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SharedFunctions{
  static void pushAndRemoveUntil(BuildContext context, Widget screen) {
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => screen),
          (Route<dynamic> route) => false,
    );
}

}