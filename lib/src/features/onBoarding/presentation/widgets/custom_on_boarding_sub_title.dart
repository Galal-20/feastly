import 'package:feastly/src/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class CustomOnBoardingSubTitle extends StatelessWidget {
  const CustomOnBoardingSubTitle({
    super.key,
    required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: AppTextStyles.onBoardingSubTitle(context),
      textAlign: TextAlign.center,
    );
  }
}
