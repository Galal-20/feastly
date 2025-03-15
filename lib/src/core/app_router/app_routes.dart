import 'package:feastly/src/features/auth/persentation/Login/LoginScreen.dart';
import 'package:feastly/src/features/home/presentation/screens/HomeScreen.dart';
import 'package:feastly/src/features/onBoarding/presentation/views/on_boarding_view.dart';
import 'package:feastly/src/features/profile/presentation/screens/profile_screen.dart';
import 'package:feastly/src/features/splash/presentation/views/splash_screen_view.dart';
import 'package:go_router/go_router.dart';
import 'package:feastly/src/features/home/presentation/bloc/HomeBloc.dart';
import 'package:feastly/src/features/home/presentation/screens/add_your_recipe_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../features/auth/persentation/AuthBloc/AuthBloc.dart';
import '../../features/homePage/presentation/screens/HomePage.dart';
import '../../features/profile/presentation/bloc/profile_bloc.dart';
import '../service_locator/service_locator.dart';

abstract class AppRoutes {
  static const kSplashScreen = '/';
  static const kOnBoardingView = '/OnBoardingView';
  static const kLoginView = '/LoginView';
  static const kRegisterView = '/RegisterView';
  static const kProfileView = '/ProfileView';
  static const kHomeScreen = '/HomeScreen';
  static const kHomePage = '/HomePage';
  static const kAiResultView = '/AiResultView';
  static const kErrorView = '/ErrorView';
  static const kAddUrRecipeView = '/AddUrRecipeView';


  static final router = GoRouter(
    initialLocation: AppRoutes.kLoginView,
    routes: [
      GoRoute(
        path: kSplashScreen,
        builder: (context, state) => const SplashScreenView(),
      ),
      GoRoute(
        path: kOnBoardingView,
        builder: (context, state) => const OnBoardingView(),
      ),
      GoRoute(
          path: kHomePage,
          builder: (context, state) => const HomePage()
      ),
      GoRoute(
        path: kAddUrRecipeView,
        name: kAddUrRecipeView,
        builder: (context, state) =>
            BlocProvider(
              create: (context) => PickImageBloc(),
              child: const AddYourRecipeScreen(),
            ),
      ),
      GoRoute(
          path: kLoginView,
          builder: (context, state) =>
              LoginScreen()
      ),
      GoRoute(path: kProfileView,
        builder: (context, state) =>
            BlocProvider(
              create: (context) => ProfileBloc(sl()),
              child: ProfileScreen(),
            ),)

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
