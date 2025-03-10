import 'package:feastly/src/core/constants/colors.dart';
import 'package:feastly/src/features/splash/presentation/widgets/splash_screen_view_body.dart';
import 'package:flutter/material.dart';

class SplashScreenView extends StatelessWidget {
  const SplashScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.splashColor,
      body: const SplashScreenViewBody(),
    );
  }
}
