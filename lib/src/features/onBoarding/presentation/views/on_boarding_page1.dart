import 'package:feastly/assets.dart';
import 'package:feastly/src/core/constants/strings.dart';
import 'package:feastly/src/features/onBoarding/presentation/widgets/custom_on_boarding_container.dart';
import 'package:feastly/src/features/onBoarding/presentation/widgets/custom_on_boarding_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../core/utils/app_text_styles.dart';
import '../widgets/button.dart';

class OnBoardingPage1 extends StatelessWidget {
  const OnBoardingPage1({super.key});

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
                        AppStrings.onBoardingTitle1,
                          style: AppTextStyles.styleBold16(context).copyWith(
                            color: Colors.black
                          )
                      ),
                      Text(
                        AppStrings.onBoardingBody1,
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
