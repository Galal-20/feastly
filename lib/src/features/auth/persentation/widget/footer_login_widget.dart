import 'package:flutter/material.dart';

import '../../../../core/constants/strings.dart';
import '../../../../core/functions/functions.dart';
import '../sign_up/sign_up_screen.dart';

class FooterLogin extends StatelessWidget {
  const FooterLogin({
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
