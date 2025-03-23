import 'package:feastly/src/core/app_router/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/constants/strings.dart';

class footer_signUp extends StatelessWidget {
  const footer_signUp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        // Navigator.push(
        //     context, MaterialPageRoute(builder: (context) => LoginScreen()));
        GoRouter.of(context).go(AppRoutes.kLoginView);
      },
      child: const Text(
        AppStrings.loginNow,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
