
import 'package:flutter/material.dart';

// error in this function
class SharedFunctions{
  static void pushAndRemoveUntil(BuildContext context, Widget screen) {
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => screen),
          (Route<dynamic> route) => false,
    );
}

}