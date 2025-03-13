import 'package:feastly/assets.dart';
import 'package:feastly/src/core/constants/strings.dart';
import 'package:feastly/src/features/onBoarding/presentation/widgets/custom_on_boarding_container.dart';
import 'package:feastly/src/features/onBoarding/presentation/widgets/custom_on_boarding_image_widget.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/app_text_styles.dart';

class OnBoardingPage2 extends StatelessWidget {
  const OnBoardingPage2({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
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
              bottom: -185,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  spacing: 15,
                  children: [
                    Text(
                      AppStrings.onBoardingTitle2,
                        style: AppTextStyles.styleBold16(context).copyWith(
                            color: Colors.black
                        )
                    ),
                    Text(
                      AppStrings.onBoardingBody2,
                      textAlign: TextAlign.center,
                        style: AppTextStyles.styleMedium16(context).copyWith(
                            color: Colors.black
                        )
                    ),
                  ],
                ),
              ),),
          ],
        ),
      ],
    );
  }
}
