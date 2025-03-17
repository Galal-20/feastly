import 'package:flutter/material.dart';

import '../../../../core/constants/strings.dart';
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
         Text(
           AppStrings.dontHaveMessage,
           style: Theme.of(context).textTheme.titleLarge,
         ),
        TextButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => RegisterScreen()));
          },
          child:  Text(
            AppStrings.signUp,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
      ],
    );
  }
}
