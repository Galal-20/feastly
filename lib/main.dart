import 'package:feastly/bloc_observer.dart';
import 'package:feastly/src/core/Theme/AppTheme.dart';
import 'package:feastly/src/core/app_router/app_routes.dart';
import 'package:feastly/src/core/service_locator/service_locator.dart';
import 'package:feastly/src/features/homePage/presentation/bloc/NavBloc.dart';
import 'package:feastly/src/core/constants/strings.dart';
import 'package:feastly/src/core/utils/size_config.dart';
import 'package:feastly/src/features/auth/persentation/auth_bloc/auth_bloc.dart';
import 'package:feastly/src/features/auth/persentation/auth_bloc/auth_event.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  ServiceLocator.init();
  Bloc.observer = MyBlocObserver();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => NavBloc()),
        BlocProvider(
          create: (context) =>
              AuthBloc(authRepository: sl())..add(AutoLoginRequested()),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return MaterialApp.router(
      theme: AppTheme.lightTheme(context),
      routerConfig: AppRoutes.router,
      debugShowCheckedModeBanner: false,
      title: AppStrings.appName,
    );
  }
}
