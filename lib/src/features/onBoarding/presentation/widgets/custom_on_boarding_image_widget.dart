import 'package:feastly/src/core/constants/colors.dart';
import 'package:feastly/src/core/utils/size_config.dart';
import 'package:flutter/material.dart';

class CustomOnBoardingImageWidget extends StatelessWidget {
  const CustomOnBoardingImageWidget({
    super.key,
    required this.imageLocation,
  });
  final String imageLocation;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: -100,
      child: Container(
        width: SizeConfig.width * 0.6,
        height: SizeConfig.height * 0.3,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.transparent,
          border: Border.all(
            color: AppColors.splashColor,
            width: 2,
          ),
        ),
        child: Center(
          child: Image.asset(
            imageLocation,
            fit: BoxFit.cover,
            height: SizeConfig.height * 0.25,
          ),
        ),
      ),
    );
  }
}
