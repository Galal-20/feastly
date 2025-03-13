import 'package:feastly/src/core/constants/colors.dart';
import 'package:feastly/src/features/onBoarding/presentation/views/on_boarding_page3.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../core/app_router/app_routes.dart';
import '../widgets/button.dart';
import 'on_boarding_page1.dart';
import 'on_boarding_page2.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  Future<void> _completeOnboarding() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('intro_completed', true);
    if (!mounted) return;
    GoRouter.of(context).pushReplacement(AppRoutes.kHomeView);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kWhite,
      body: Stack(
        children: [
          Positioned.fill(
            child: PageView(
              controller: _pageController,
              onPageChanged: (index) => setState(() => _currentPage = index),
              children: const [
                OnBoardingPage1(),
                OnBoardingPage2(),
                OnBoardingPage3(),
              ],
            ),
          ),
          Positioned(
              bottom: 40,
              left: 0,
              right: 0,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    PublicButton(
                      function: _completeOnboarding,
                      text: 'Skip',
                      height: MediaQuery.sizeOf(context).height * 0.035,
                      borderRadius: 12,
                    ),
                    SmoothPageIndicator(
                      controller: _pageController,
                      count: 3,
                      effect: const ExpandingDotsEffect(
                        activeDotColor: tSecondaryColor,
                        dotHeight: 8,
                      ),
                    ),
                    _currentPage != 2
                        ? PublicButton(
                            function: () => _pageController.nextPage(
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.ease,
                            ),
                            text: 'Next',
                            height: MediaQuery.sizeOf(context).height * 0.035,
                            borderRadius: 12,
                          )
                        : PublicButton(
                            function: _completeOnboarding,
                            text: 'Login',
                            height: MediaQuery.sizeOf(context).height * 0.035,
                            borderRadius: 12,
                            textColor: Colors.black,
                            backgroundColor: Colors.white,
                          ),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
