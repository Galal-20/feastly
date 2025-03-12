import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../home/presentation/screens/HomeScreen.dart';
import '../AuthBloc/AuthBloc.dart';
import '../AuthBloc/AuthState.dart';
import '../Login/LoginScreen.dart';
import '../verification/verification_screen.dart';

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message)),
          );
        }
        if (state is EmailVerified) {
          Navigator.of(context).pushReplacementNamed('/home');
        }
      },
      child: BlocBuilder<AuthBloc, AuthState>(
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
      ),
    );
  }
}