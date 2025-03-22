import 'package:feastly/src/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/colors.dart';

class CustomOnBoardingTextButton extends StatelessWidget {
  const CustomOnBoardingTextButton({
    super.key,
    this.onPressed,
    required this.text,
  });
  final void Function()? onPressed;
  final String text;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: Theme.of(context)
            .textTheme
            .displayMedium!
            .copyWith(color: AppColors.splashColor),
        textAlign: TextAlign.center,
      ),
    );
  }
}
