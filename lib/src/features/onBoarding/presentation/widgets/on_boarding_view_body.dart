import 'package:feastly/assets.dart';
import 'package:feastly/src/features/onBoarding/presentation/widgets/custom_on_boarding_container.dart';
import 'package:feastly/src/features/onBoarding/presentation/widgets/custom_on_boarding_image_widget.dart';
import 'package:flutter/material.dart';

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
          ],
        ),
      ],
    );
  }
}
