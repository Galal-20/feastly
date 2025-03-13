import 'package:feastly/src/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class CustomOnBoardingTitle extends StatelessWidget {
  const CustomOnBoardingTitle({
    super.key,
    required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: AppTextStyles.onBoardingTitle(context),
      textAlign: TextAlign.center,
    );
  }
}
