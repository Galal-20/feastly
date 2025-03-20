import 'dart:async';
import 'package:feastly/src/core/app_router/app_routes.dart';
import 'package:feastly/src/core/constants/colors.dart';
import 'package:feastly/src/features/auth/auth_bloc/auth_bloc.dart';
import 'package:feastly/src/features/auth/auth_bloc/auth_event.dart';
import 'package:feastly/src/features/auth/auth_bloc/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:feastly/src/core/constants/strings.dart';
import '../../widget/background_from_widget.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({super.key});

  @override
  _VerificationScreenState createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  bool isCooldown = false;
  Timer? _timer;
  bool verified = false;

  @override
  void initState() {
    super.initState();
    _startVerificationCheckTimer();

  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startVerificationCheckTimer() {
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      context.read<AuthBloc>().add(CheckEmailVerification());
    });
  }

  void _resendEmail() {
    if (!isCooldown) {
      context.read<AuthBloc>().add(ResendEmailVerification());
      setState(() {
        isCooldown = true;
      });
      Future.delayed(const Duration(seconds: 60), () {
        setState(() {
          isCooldown = false;
        });
      });
    }
  }

  Future<void> _handleVerificationSuccess() async {
    _timer?.cancel();
    // Save login state
    // Save verification state in SharedPreferences
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isVerified', true);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(AppStrings.verificationSuc),
        backgroundColor: Colors.green,
        duration: Duration(seconds: 3),
      ),
    );
    await Future.delayed(const Duration(seconds: 3));
    navigateToHome();
    // Navigate to home screen
    //Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
  }

  void navigateToHome() {
    GoRouter.of(context).go(AppRoutes.kHomePage);
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors.splashColor,
      body: Stack(
        children: [
          background_form(),
          BlocListener<AuthBloc, AuthState>(
            listener: (context, state) {
              if (state is VerificationEmailSent) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.message),
                    backgroundColor: Colors.green,
                    duration: const Duration(seconds: 3),
                  ),
                );
              } else if (state is AuthError) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.message),
                    backgroundColor: Colors.red,
                    duration: const Duration(seconds: 3),
                  ),
                );
              } else if (state is EmailVerified) {
                _handleVerificationSuccess();
                //_checkEmailVerification();
              }
            },
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.email_rounded,
                      size: screenWidth * 0.3, color: Colors.white),
                  SizedBox(height: screenHeight * 0.03),
                  Text(
                    AppStrings.textMessageResend,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: screenWidth * 0.05,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  ElevatedButton(
                    onPressed: isCooldown ? null : _resendEmail,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(
                        horizontal: screenWidth * 0.2,
                        vertical: screenHeight * 0.015,
                      ),
                    ),
                    child: Text(
                      AppStrings.resendEmail,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: screenWidth * 0.045,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
