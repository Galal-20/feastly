import 'package:feastly/src/features/auth/data/AuthRepository.dart';
import 'package:feastly/src/features/auth/persentation/AuthBloc/AuthBloc.dart';
import 'package:feastly/src/features/auth/persentation/AuthBloc/AuthEvent.dart';
import 'package:feastly/src/features/auth/persentation/Login/LoginScreen.dart';
import 'package:feastly/src/features/auth/persentation/SIgnUp/SignUpScreen.dart';
import 'package:feastly/src/features/auth/persentation/verification/verification_screen.dart';
import 'package:feastly/src/features/auth/persentation/widget/auth_wrapper.dart';
import 'package:feastly/src/features/home/presentation/screens/HomeScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );



  final authRepository = AuthRepository(firebaseAuthService: FirebaseAuthDataSource());

  runApp(
    BlocProvider(
      create: (context) =>
          AuthBloc(authRepository: authRepository)..add(AutoLoginRequested()),
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

      routerConfig: AppRoutes.router,
      debugShowCheckedModeBanner: false,
      title: AppStrings.appName,


    );
  }
}
