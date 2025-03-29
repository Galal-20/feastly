import 'package:feastly/src/features/onBoarding/domain/entities/on_boarding_entity.dart';
import 'package:feastly/src/features/onBoarding/presentation/widgets/custom_page_view_body.dart';
import 'package:flutter/material.dart';

class CustomPageView extends StatelessWidget {
  const CustomPageView({
    super.key,
    required this.pageController,
  });
  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemBuilder: (context, index) => CustomPageViewBody(
        title: onBoardingItems[index].title,
        body: onBoardingItems[index].subtitle,
      ),
      itemCount: onBoardingItems.length,
      controller: pageController,
      physics: const NeverScrollableScrollPhysics(),
    );
  }
}
