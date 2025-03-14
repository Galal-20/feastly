import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/strings.dart';
import '../../../../core/functions/functions.dart';
import '../Login/LoginScreen.dart';

class footer_signUp extends StatelessWidget {
  const footer_signUp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        SharedFunctions.pushAndRemoveUntil(context, LoginScreen());
      },
      child: const Text(
        loginNow,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}

