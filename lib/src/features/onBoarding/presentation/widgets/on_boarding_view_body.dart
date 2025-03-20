import 'package:feastly/src/core/app_router/app_routes.dart';
import 'package:feastly/src/core/constants/strings.dart';
import 'package:feastly/src/core/helper/shared_prefrences_helper.dart';
import 'package:feastly/src/core/utils/size_config.dart';
import 'package:feastly/src/features/onBoarding/domain/entities/on_boarding_entity.dart';
import 'package:feastly/src/features/onBoarding/presentation/widgets/custom_on_boarding_bottom_widget.dart';
import 'package:feastly/src/features/onBoarding/presentation/widgets/custom_on_boarding_container.dart';
import 'package:feastly/src/features/onBoarding/presentation/widgets/custom_on_boarding_image_widget.dart';
import 'package:feastly/src/features/onBoarding/presentation/widgets/custom_page_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OnBoardingViewBody extends StatefulWidget {
  const OnBoardingViewBody({super.key});

  @override
  State<OnBoardingViewBody> createState() => _OnBoardingViewBodyState();
}

class _OnBoardingViewBodyState extends State<OnBoardingViewBody> {
  final PageController _pageController = PageController(initialPage: 0);
  int currIndex = 0;
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
              imageLocation: onBoardingItems[currIndex].image,
            ),
          ],
        ),
        SizedBox(
          height: SizeConfig.height * 0.15,
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10.0,
            ),
            child: CustomPageView(
              pageController: _pageController,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: CustomOnBoardingBottomWidget(
            currPage: currIndex,
            pageController: _pageController,
            onNextPressed: navigateToNextPage,
            onSkipPressed: () async {
              await checkLoginStatus();
            },
          ),
        ),
      ],
    );
  }

  void navigateToNextPage() async {
    if (_pageController.page == onBoardingItems.length - 1) {
      await checkLoginStatus();
      return;
    }
    _pageController.nextPage(
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeIn,
    );
    setState(() {
      currIndex++;
    });
  }

  Future<void> checkLoginStatus() async {
    var loginStatus =
        await SharedPreferencesHelper.getBool(AppStrings.userLoggedInKey);
    if (loginStatus != null && loginStatus) {
      navigateToScreen(path: AppRoutes.kHomePage);
    } else {
      navigateToScreen(path: AppRoutes.kLoginView);
    }
  }

  void navigateToScreen({required String path}) {
    SharedPreferencesHelper.saveBool(AppStrings.onBoardingStatusKey, true);
    GoRouter.of(context).go(path);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
