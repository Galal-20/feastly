import 'package:feastly/src/core/constants/colors.dart';
import 'package:feastly/src/core/utils/size_config.dart';
import 'package:flutter/material.dart';

abstract class AppTextStyles {
  static TextStyle onBoardingTitle(context) => TextStyle(
        fontSize: getResponsiveFontSize(context, 24),
        fontFamily: 'Inter',
        fontWeight: FontWeight.w700,
        color: Colors.black,
      );
  static TextStyle onBoardingSubTitle(context) => TextStyle(
        fontSize: getResponsiveFontSize(context, 20),
        fontFamily: 'Inter',
        fontWeight: FontWeight.w700,
        color: AppColors.splashColor,
      );
  static TextStyle textBtnStyle(context) => TextStyle(
        fontSize: getResponsiveFontSize(context, 20),
        fontFamily: 'Inter',
        fontWeight: FontWeight.w700,
        color: AppColors.splashColor,
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

  static styleMedium16(BuildContext context) {}
}
