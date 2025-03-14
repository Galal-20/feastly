import 'dart:async';
import 'package:feastly/src/core/constants/colors.dart';
import 'package:feastly/src/core/constants/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../AuthBloc/AuthBloc.dart';
import '../AuthBloc/AuthEvent.dart';
import '../AuthBloc/AuthState.dart';
import 'package:feastly/src/core/constants/strings.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({super.key});

  @override
  _VerificationScreenState createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  bool isCooldown = false;
  Timer? _timer;

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
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool("isLoggedIn", true);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(verificationSuc),
        backgroundColor: Colors.green,
        duration: Duration(seconds: 3),
      ),
    );
    await Future.delayed(const Duration(seconds: 3));
    // After make Home Screen make this line.
    //SharedFunctions.pushAndRemoveUntil(context, HomeScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.splashColor,
      body: Stack(
        children: [
          Positioned.fill(
            child: Opacity(
              opacity: 1,
              child: Image.asset(
                backGround,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: BlocListener<AuthBloc, AuthState>(
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
                }
              },
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.email_rounded,
                        size: 150, color: Colors.white),
                    const SizedBox(height: 20),
                    const Text(
                      textMessageResend,
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: isCooldown ? null : _resendEmail,
                      child: isCooldown
                          ? const Text(waitFor)
                          : const Text(
                              resendEmail,
                              style: TextStyle(color: Colors.black),
                            ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
