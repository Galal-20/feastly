import 'dart:async';
import 'package:feastly/src/core/constants/colors.dart';
import 'package:feastly/src/core/constants/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../../main.dart';
import '../../../../core/functions/functions.dart';
import '../AuthBloc/AuthBloc.dart';
import '../AuthBloc/AuthEvent.dart';
import '../AuthBloc/AuthState.dart';
import 'package:feastly/src/core/constants/strings.dart';

import '../widget/background_from_widget.dart';

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
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: splashColor,
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
              }
            },
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                      Icons.email_rounded,
                      size: screenWidth * 0.3,
                      color: Colors.white),
                  SizedBox(height: screenHeight * 0.03),
                   Text(
                    textMessageResend,
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
                      resendEmail,
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
