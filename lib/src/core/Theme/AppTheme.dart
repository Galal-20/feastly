import 'package:feastly/src/core/constants/colors.dart';
import 'package:feastly/src/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

import '../utils/size_config.dart';

class AppTheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
        primaryColor: AppColors.splashColor,
        scaffoldBackgroundColor: AppColors.tWhite,
        fontFamily: 'Inter',
        textTheme: TextTheme(
          displayLarge: TextStyle(
              fontSize: getResponsiveFontSize(context, 25),
              fontWeight: FontWeight.w700,
              color: AppColors.tBlack),
          displayMedium: TextStyle(
              fontSize: getResponsiveFontSize(context, 20),
              fontWeight: FontWeight.w700,
              color: AppColors.tBlack),
          displaySmall: TextStyle(
              fontSize: getResponsiveFontSize(context, 22),
              fontWeight: FontWeight.w700,
              color: AppColors.tBlack),
          headlineMedium: TextStyle(
              fontSize: getResponsiveFontSize(context, 18),
              fontWeight: FontWeight.w700,
              color: AppColors.tBlack),
          headlineSmall: TextStyle(
              fontSize: getResponsiveFontSize(context, 14),
              fontWeight: FontWeight.w500,
              color: AppColors.tWhite),
          titleLarge: TextStyle(
              fontSize: getResponsiveFontSize(context, 18),
              fontWeight: FontWeight.w400,
              color: AppColors.tWhite),
          bodyMedium: TextStyle(
              fontSize: getResponsiveFontSize(context, 12),
              fontWeight: FontWeight.w500,
              color: AppColors.tWhite),
          bodyLarge: TextStyle(
              fontSize: getResponsiveFontSize(context, 15),
              fontWeight: FontWeight.w500,
              color: AppColors.greyColor),
          titleSmall: TextStyle(
              fontSize: getResponsiveFontSize(context, 17),
              fontWeight: FontWeight.w500,
              color: AppColors.greyColor),
          titleMedium: TextStyle(
              fontSize: getResponsiveFontSize(context, 20),
              fontWeight: FontWeight.w400,
              color: AppColors.greyColor),
          labelLarge: TextStyle(
              fontSize: getResponsiveFontSize(context, 18),
              fontWeight: FontWeight.w500,
              color: AppColors.splashColor),
          bodySmall: TextStyle(
              fontSize: getResponsiveFontSize(context, 14),
              fontWeight: FontWeight.w700,
              color: AppColors.splashColor),
        ),
      );

  static double getResponsiveFontSize(BuildContext context, double fontSize) {
    double scaleFactor = getScaleFactor(context);
    double responsiveFontSize = fontSize * scaleFactor;
    double lowerLimit = fontSize * 0.8;
    double upperLimit = fontSize * 1.2;

    return responsiveFontSize.clamp(lowerLimit, upperLimit);
  }

  static double getScaleFactor(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    if (width < SizeConfig.tablet) {
      return width / 550;
    } else if (width < SizeConfig.desktop) {
      return width / 1000;
    } else {
      return width / 1920;
    }
  }
}
