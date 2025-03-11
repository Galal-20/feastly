import 'package:feastly/src/features/auth/data/AuthRepository.dart';
import 'package:feastly/src/features/auth/persentation/AuthBloc/AuthBloc.dart';
import 'package:feastly/src/features/auth/persentation/AuthBloc/AuthEvent.dart';
import 'package:feastly/src/features/auth/persentation/AuthBloc/AuthState.dart';
import 'package:feastly/src/features/auth/persentation/Login/LoginScreen.dart';
import 'package:feastly/src/features/auth/persentation/SIgnUp/SignUpScreen.dart';
import 'package:feastly/src/features/auth/persentation/verification/verification_screen.dart';
import 'package:feastly/src/features/home/presentation/screens/HomeScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final authRepository = AuthRepository();

  runApp(
    BlocProvider(
      create: (context) => AuthBloc(authRepository: authRepository)..add(AutoLoginRequested()),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      supportedLocales: const [
        Locale('en', ''),
        Locale('ar', ''),
      ],
      localizationsDelegates: const [
        // Add localization delegates here
      ],
      localeResolutionCallback: (locale, supportedLocales) {
        for (var supportedLocale in supportedLocales) {
          if (supportedLocale.languageCode == locale?.languageCode) {
            return supportedLocale;
          }
        }
        return supportedLocales.first;
      },
      home: const AuthWrapper(),
      routes: {
        '/login': (context) => const LoginScreen(),
        '/register': (context) => const RegisterScreen(),
        '/verification': (context) => const VerificationScreen(),
        '/home': (context) => const HomeScreen(),
      },
    );
  }
}

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message)),
          );
        }
      },
      builder: (context, state) {
        if (state is AuthLoading) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        } else if (state is Authenticated) {
          return const HomeScreen();
        } else if (state is NeedsEmailVerification) {
          return const VerificationScreen();
        } else {
          return const LoginScreen();
        }
      },
    );
  }
}
