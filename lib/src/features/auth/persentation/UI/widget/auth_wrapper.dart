import 'package:feastly/src/features/auth/auth_bloc/auth_bloc.dart';
import 'package:feastly/src/features/auth/auth_bloc/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../screen/login/login_screen.dart';
import '../screen/verification/verification_screen.dart';


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
          // Navigate to home
          //SharedFunctions.pushAndRemoveUntil(context, HomeScreen());
        }
      },
      child: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          if (state is AuthLoading) {
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          } else if (state is Authenticated) {
            // Navigate to Home
            return VerificationScreen();
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
