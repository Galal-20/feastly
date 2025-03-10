import 'package:feastly/assets.dart';
import 'package:feastly/src/core/constants/colors.dart';
import 'package:feastly/src/core/utils/size_config.dart';
import 'package:feastly/src/features/onBoarding/presentation/widgets/custom_container_clipper.dart';
import 'package:flutter/material.dart';

class CustomOnBoardingContainer extends StatelessWidget {
  const CustomOnBoardingContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: CustomContainerClipper(),
      child: Container(
        height: SizeConfig.height * 0.5,
        width: double.infinity,
        color: AppColors.splashColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: SizeConfig.height * 0.15),
            Image.asset(
              Assets.app_logo,
              height: SizeConfig.height * 0.15,
              fit: BoxFit.cover,
            ),
          ],
        ),
      ),
    );
  }
}
