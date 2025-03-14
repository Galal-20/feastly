import 'package:feastly/src/features/onBoarding/presentation/views/on_boarding_view.dart';
import 'package:feastly/src/features/splash/presentation/views/splash_screen_view.dart';
import 'package:go_router/go_router.dart';

abstract class AppRoutes {
  static const kSplashScreen = '/';
  static const kOnBoardingView = '/OnBoardingView';
  static const kLoginView = '/LoginView';
  static const kRegisterView = '/RegisterView';
  static const kHomeView = '/HomeView';
  static const kAiResultView = '/AiResultView';
  static const kErrorView = '/ErrorView';

  static final router = GoRouter(
    initialLocation: AppRoutes.kSplashScreen,
    routes: [
      GoRoute(
        path: kSplashScreen,
        builder: (context, state) => const SplashScreenView(),
      ),
      GoRoute(
        path: kOnBoardingView,
        builder: (context, state) => const OnBoardingView(),
      ),
      // GoRoute(
      //   path: kLoginView,
      //   pageBuilder: (context, state) =>
      //       AppAnimations.customSlideUpTransition(state, const LoginView()),
      // ),
      // GoRoute(
      //   path: kRegisterView,
      //   pageBuilder: (context, state) =>
      //       AppAnimations.customSlideUpTransition(state, const RegisterView()),
      // ),
      // GoRoute(
      //   path: kAiResultView,
      //   pageBuilder: (context, state) => AppAnimations.customSlideUpTransition(
      //       state,
      //       AiResultView(
      //         weatherEntity: state.extra as WeatherEntity,
      //       )),
      // ),
      // GoRoute(
      //   path: kHomeView,
      //   pageBuilder: (context, state) =>
      //       AppAnimations.customGrowTransition(state, const HomeView()),
      // ),
      // GoRoute(
      //   path: kErrorView,
      //   pageBuilder: (context, state) => AppAnimations.customGrowTransition(
      //       state,
      //       CustomErrorScreen(
      //         errMsg: (state.extra as ErrorScreenArgs).errMsg,
      //         onPressed: (state.extra as ErrorScreenArgs).onPressed,
      //       )),
      // ),
    ],
  );
}
