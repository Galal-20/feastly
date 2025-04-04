// import 'package:feastly/src/core/constants/colors.dart';
// import 'package:feastly/src/core/utils/size_config.dart';
// import 'package:flutter/material.dart';
//
// abstract class AppTextStyles {
//   static TextStyle styleBold(
//       context,
//       Color? color,
//       double? fontSize,
//       FontWeight? fontWeight,
//       String? fontFamily
//       ) => TextStyle(
//     fontSize: fontSize,
//     fontFamily: fontFamily,
//     fontWeight: fontWeight,
//     color: color,
//   );
//
//   static TextStyle styleRegular20(
//       context
//       ) => TextStyle(
//         fontSize: getResponsiveFontSize(context, 20),
//         fontFamily: 'Ubuntu',
//         fontWeight: FontWeight.w400,
//         color: AppColors.splashColor,
//       );
//
//   static TextStyle styleRegular12(context) => TextStyle(
//     fontSize: getResponsiveFontSize(context, 12),
//     fontFamily: 'Ubuntu',
//     fontWeight: FontWeight.w400,
//     color: Colors.white,
//   );
//
//   static TextStyle styleMedium16(context) => TextStyle(
//         fontSize: getResponsiveFontSize(context, 16),
//         fontFamily: 'Ubuntu',
//         fontWeight: FontWeight.w500,
//         color: Colors.white,
//       );
//
//
//   static TextStyle styleRegular14(context) => TextStyle(
//     fontSize: getResponsiveFontSize(context, 14),
//     fontFamily: 'Ubuntu',
//     fontWeight: FontWeight.w500,
//     color: AppColors.splashColor,
//   );
//
//
//   static TextStyle styleBold16(context) => TextStyle(
//         fontSize: getResponsiveFontSize(context, 16),
//         fontFamily: 'Ubuntu',
//         fontWeight: FontWeight.w700,
//         color: Colors.black,
//       );
//
//   static TextStyle styleBold23(context) => TextStyle(
//         fontSize: getResponsiveFontSize(context, 20),
//         fontFamily: 'Inter',
//         fontWeight: FontWeight.bold,
//         color: Colors.black,
//       );
//
//
//   static TextStyle styleBold25(context) => TextStyle(
//         fontSize: getResponsiveFontSize(context, 25),
//         fontFamily: 'Ubuntu',
//         fontWeight: FontWeight.w700,
//         color: AppColors.splashColor,
//       );
//   static TextStyle styleBold40(context) => TextStyle(
//         fontSize: getResponsiveFontSize(context, 40),
//         fontFamily: 'Ubuntu',
//         fontWeight: FontWeight.w700,
//         color: Colors.white,
//       );
//   static TextStyle styleBold50(context) => TextStyle(
//         fontSize: getResponsiveFontSize(context, 50),
//         fontFamily: 'Ubuntu',
//         fontWeight: FontWeight.w700,
//         color: Colors.white,
//       );
//   static TextStyle styleBold60(context) => TextStyle(
//         fontSize: getResponsiveFontSize(context, 60),
//         fontFamily: 'Ubuntu',
//         fontWeight: FontWeight.w700,
//         color: Colors.white,
//       );
//
//   static TextStyle styleMedium20(context) => TextStyle(
//         fontSize: getResponsiveFontSize(context, 20),
//         fontFamily: 'Ubuntu',
//         fontWeight: FontWeight.w500,
//         color: Colors.white,
//       );
//   static TextStyle styleMedium25(context) => TextStyle(
//         fontSize: getResponsiveFontSize(context, 25),
//         fontFamily: 'Ubuntu',
//         fontWeight: FontWeight.w500,
//         color: Colors.white,
//       );
//   static TextStyle buttonTextStyle(context) => TextStyle(
//         fontSize: getResponsiveFontSize(context, 12),
//         fontFamily: 'Ubuntu',
//         fontWeight: FontWeight.w500,
//         color: Colors.white,
//       );
//   static TextStyle textButtonTextStyle(context) => TextStyle(
//         fontSize: getResponsiveFontSize(context, 16),
//         fontFamily: 'Ubuntu',
//         fontWeight: FontWeight.w500,
//         color: Colors.white,
//       );
//
//   static TextStyle onBoardingTitle(context) => TextStyle(
//         fontSize: getResponsiveFontSize(context, 24),
//         fontFamily: 'Inter',
//         fontWeight: FontWeight.w700,
//         color: Colors.black,
//       );
//
//   static TextStyle onBoardingSubTitle(context) => TextStyle(
//         fontSize: getResponsiveFontSize(context, 20),
//         fontFamily: 'Inter',
//         fontWeight: FontWeight.w700,
//         color: AppColors.splashColor,
//       );
//   static TextStyle textBtnStyle(context) => TextStyle(
//         fontSize: getResponsiveFontSize(context, 20),
//         fontFamily: 'Inter',
//         fontWeight: FontWeight.w700,
//         color: AppColors.splashColor,
//       );
//
//   static double getResponsiveFontSize(BuildContext context, double fontSize) {
//     double scaleFactor = getScaleFactor(context);
//     double responsiveFontSize = fontSize * scaleFactor;
//     double lowerLimit = fontSize * 0.8;
//     double upperLimit = fontSize * 1.2;
//
//     return responsiveFontSize.clamp(lowerLimit, upperLimit);
//   }
//
//   static double getScaleFactor(BuildContext context) {
//     double width = MediaQuery.of(context).size.width;
//     if (width < SizeConfig.tablet) {
//       return width / 550;
//     } else if (width < SizeConfig.desktop) {
//       return width / 1000;
//     } else {
//       return width / 1920;
//     }
//   }
// }
