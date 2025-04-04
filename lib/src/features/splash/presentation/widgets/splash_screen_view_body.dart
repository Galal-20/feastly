import 'dart:async';

import 'package:feastly/assets.dart';
import 'package:feastly/src/core/app_router/app_routes.dart';
import 'package:feastly/src/core/constants/strings.dart';
import 'package:feastly/src/core/helper/shared_prefrences_helper.dart';
import 'package:feastly/src/core/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreenViewBody extends StatefulWidget {
  const SplashScreenViewBody({super.key});

  @override
  State<SplashScreenViewBody> createState() => _SplashScreenViewBodyState();
}

class _SplashScreenViewBodyState extends State<SplashScreenViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _positionAnimation;
  late Animation<double> _rotationAnimation;

  @override
  void initState() {
    super.initState();
    initializeAnimationController();

    initializePositionAnimation();

    initializeRotationAnimation();

    _controller.forward();
    Timer(const Duration(seconds: 3), checkOnBoardingStatus);
  }

  void initializeAnimationController() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2), // Adjust the duration as needed
    );
  }

  void initializeRotationAnimation() {
    _rotationAnimation = Tween<double>(
      begin: 0.0,
      end: 2 * 3.14, // Rotate 360 degrees (2 * pi radians)
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
  }

  void initializePositionAnimation() {
    _positionAnimation = Tween<Offset>(
      begin: Offset(-1.0, 0.0), // Start from the left
      end: Offset(0.0, 0.0), // End at the center
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut, // Adjust the curve as needed
    ));
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Transform.translate(
          offset: _positionAnimation.value * MediaQuery.of(context).size.width,
          child: Transform.rotate(
            angle: _rotationAnimation.value,
            child: Center(
              child: Hero(
                tag: AppStrings.onBoardingHeroLogoWidgetTag,
                child: Image.asset(
                  Assets.app_logo,
                  height: SizeConfig.height * 0.2,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  void navigateToOnBoarding() {
    GoRouter.of(context).go(AppRoutes.kOnBoardingView);
  }

  void navigateToLogin() {
    GoRouter.of(context).go(AppRoutes.kLoginView);
  }

  void checkOnBoardingStatus() async {
    final onBoardingStatus =
        await SharedPreferencesHelper.getBool(AppStrings.onBoardingStatusKey);
    final prefs = await SharedPreferences.getInstance();
    final isVerified = prefs.getBool('isVerified') ?? false;
    if (onBoardingStatus != null && onBoardingStatus) {
      if (isVerified) {
        navigateToHome();
      } else {
        navigateToLogin();
      }
    } else {
      navigateToOnBoarding();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void navigateToHome() {
    GoRouter.of(context).go(AppRoutes.kHomePage);
  }
}
