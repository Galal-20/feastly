import 'package:feastly/src/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
      textTheme: TextTheme(
        bodyMedium: AppTextStyles.styleBold25(context)

      )
  );
}
