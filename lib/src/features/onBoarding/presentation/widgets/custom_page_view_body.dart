import 'package:feastly/src/core/utils/size_config.dart';
import 'package:feastly/src/features/onBoarding/presentation/widgets/custom_on_boarding_sub_title.dart';
import 'package:feastly/src/features/onBoarding/presentation/widgets/custom_on_boarding_title.dart';
import 'package:flutter/material.dart';

class CustomPageViewBody extends StatelessWidget {
  const CustomPageViewBody({
    super.key,
    required this.title,
    required this.body,
  });
  final String title;
  final String body;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomOnBoardingTitle(
          title: title,
        ),
        SizedBox(
          height: SizeConfig.height * 0.02,
        ),
        CustomOnBoardingSubTitle(
          title: body,
        ),
      ],
    );
  }
}
