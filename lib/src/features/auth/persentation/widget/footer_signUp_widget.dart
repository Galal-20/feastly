import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/strings.dart';
import '../screen/login/login_screen.dart';

class footer_signUp extends StatelessWidget {
  const footer_signUp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
      },
      child: const Text(
        AppStrings.loginNow,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
