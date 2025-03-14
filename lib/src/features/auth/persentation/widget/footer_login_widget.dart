import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/strings.dart';
import '../../../../core/functions/functions.dart';
import '../SIgnUp/SignUpScreen.dart';

class footer_login extends StatelessWidget {
  const footer_login({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          dontHaveMessage,
          style: TextStyle(color: Colors.white70),
        ),
        TextButton(
          onPressed: () {
            SharedFunctions.pushAndRemoveUntil(context, RegisterScreen());
          },
          child: const Text(
            signUp,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }
}

