import 'package:feastly/assets.dart';
import 'package:feastly/src/core/constants/strings.dart';

class OnBoardingEntity {
  final String title;
  final String subtitle;
  final String image;

  OnBoardingEntity({
    required this.title,
    required this.subtitle,
    required this.image,
  });
}

List<OnBoardingEntity> onBoardingItems = [
  OnBoardingEntity(
    title: AppStrings.onBoardingTitle1,
    subtitle: AppStrings.onBoardingBody1,
    image: Assets.onBoarding1,
  ),
  OnBoardingEntity(
    title: AppStrings.onBoardingTitle2,
    subtitle: AppStrings.onBoardingBody2,
    image: Assets.onBoarding2,
  ),
  OnBoardingEntity(
    title: AppStrings.onBoardingTitle3,
    subtitle: AppStrings.onBoardingBody3,
    image: Assets.onBoarding3,
  ),
];
