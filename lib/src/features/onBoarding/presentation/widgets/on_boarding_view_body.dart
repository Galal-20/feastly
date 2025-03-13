import 'package:feastly/assets.dart';
import 'package:feastly/src/core/constants/strings.dart';
import 'package:feastly/src/features/onBoarding/presentation/widgets/custom_on_boarding_container.dart';
import 'package:feastly/src/features/onBoarding/presentation/widgets/custom_on_boarding_image_widget.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/app_text_styles.dart';

class OnBoardingViewBody extends StatelessWidget {
  const OnBoardingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.bottomCenter,
          clipBehavior: Clip.none,
          children: [
            CustomOnBoardingContainer(),
            CustomOnBoardingImageWidget(
              imageLocation: Assets.onBoarding1,
            ),
            Positioned(
                child: Column(
                  children: [
                    Text(
                      AppStrings.onBoardingTitle1,
                      style: AppTextStyles.styleBold16(context),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      AppStrings.onBoardingBody1,
                      textAlign: TextAlign.center,
                      style: AppTextStyles.styleMedium16(context),
                    ),
                  ],
                ))
          ],
        ),
      ],
    );
  }
}
