import 'package:feastly/src/core/constants/colors.dart';
import 'package:feastly/src/features/onBoarding/presentation/widgets/on_boarding_view_body.dart';
import 'package:flutter/material.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kWhite,
      body: OnBoardingViewBody(),
    );
  }
}
