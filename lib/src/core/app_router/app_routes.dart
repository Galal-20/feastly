import 'package:feastly/src/features/home/presentation/bloc/HomeBloc.dart';
import 'package:feastly/src/features/home/presentation/screens/add_your_recipe_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../features/homePage/presentation/screens/HomePage.dart';


abstract class AppRoutes {
  static const kSplashScreen = '/';
  static const kAuthHomeView = '/AuthHomeView';
  static const kLoginView = '/LoginView';
  static const kRegisterView = '/RegisterView';
  static const kHomeScreen = '/HomeScreen';
  static const kHomePage = '/HomePage';
  static const kAiResultView = '/AiResultView';
  static const kErrorView = '/ErrorView';
  static const kAddurRecipeView = '/AddurRecipeView';

  static final router = GoRouter(
    initialLocation: AppRoutes.kHomePage,
    routes: [
      // GoRoute(
      //   path: kSplashScreen,
      //   builder: (context, state) => const SplashScreenView(),
      // ),
      // GoRoute(
      //   path: kAuthHomeView,
      //   pageBuilder: (context, state) =>
      //       AppAnimations.customGrowTransition(state, const AuthHomeView()),
      // ),
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
      //   path: kErrorView,
      //   pageBuilder: (context, state) => AppAnimations.customGrowTransition(
      //       state,
      //       CustomErrorScreen(
      //         errMsg: (state.extra as ErrorScreenArgs).errMsg,
      //         onPressed: (state.extra as ErrorScreenArgs).onPressed,
      //       )),
      // ),
      GoRoute(
        path: kHomePage,
        builder: (context, state) => const HomePage()
      ),
      GoRoute(
        path: kAddurRecipeView,
        name: kAddurRecipeView,
        builder: (context, state) => BlocProvider(
          create: (context) => PickImageBloc(),
          child: const AddYourRecipeScreen(),
        ),
      ),


    ],
  );
}
