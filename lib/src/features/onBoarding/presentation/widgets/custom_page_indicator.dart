import 'package:feastly/src/core/constants/colors.dart';
import 'package:feastly/src/core/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CustomPageIndicator extends StatelessWidget {
  const CustomPageIndicator({
    super.key,
    required this.pageController,
    required this.itemCount,
  });
  final PageController pageController;
  final int itemCount;
  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
      controller: pageController,
      count: 3,
      effect: JumpingDotEffect(
        activeDotColor: AppColors.splashColor,
        dotHeight: SizeConfig.height * 0.01,
        dotWidth: SizeConfig.width * 0.05,
      ),
    );
  }
}
