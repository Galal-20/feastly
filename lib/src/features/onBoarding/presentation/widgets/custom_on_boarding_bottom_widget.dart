import 'package:feastly/src/core/constants/strings.dart';
import 'package:feastly/src/core/utils/size_config.dart';
import 'package:feastly/src/features/onBoarding/domain/entities/on_boarding_entity.dart';
import 'package:feastly/src/features/onBoarding/presentation/widgets/custom_on_boarding_text_button.dart';
import 'package:feastly/src/features/onBoarding/presentation/widgets/custom_page_indicator.dart';
import 'package:flutter/material.dart';

class CustomOnBoardingBottomWidget extends StatelessWidget {
  const CustomOnBoardingBottomWidget({
    super.key,
    required this.pageController,
    this.onNextPressed,
    this.onSkipPressed,
    required this.currPage,
  });
  final int currPage;
  final PageController pageController;
  final void Function()? onNextPressed;
  final void Function()? onSkipPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        currPage != 0
            ? SizedBox(
                width: SizeConfig.width * 0.2,
              )
            : SizedBox(
                width: SizeConfig.width * 0.2,
                child: CustomOnBoardingTextButton(
                  text: AppStrings.skip,
                  onPressed: onSkipPressed,
                ),
              ),
        Spacer(),
        CustomPageIndicator(
          pageController: pageController,
          itemCount: onBoardingItems.length,
        ),
        Spacer(),
        SizedBox(
          width: SizeConfig.width * 0.2,
          child: CustomOnBoardingTextButton(
            text: AppStrings.next,
            onPressed: onNextPressed,
          ),
        ),
      ],
    );
  }
}
