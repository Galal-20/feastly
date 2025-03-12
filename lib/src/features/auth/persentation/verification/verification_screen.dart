import 'package:feastly/src/core/constants/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../AuthBloc/AuthBloc.dart';
import '../AuthBloc/AuthEvent.dart';
import '../AuthBloc/AuthState.dart';


class VerificationScreen extends StatefulWidget {
  const VerificationScreen({super.key});

  @override
  _VerificationScreenState createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  bool isCooldown = false;

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Color(0xff001A3F),
      body: Stack(
        children: [
          Positioned.fill(
            child: Opacity(
              opacity: 1,
              child: Image.asset(
                'assets/images/bg.png',
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
                      duration: Duration(seconds: 3),
                    ),
                  );
                } else if (state is AuthError) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(state.message),
                      backgroundColor: Colors.red,
                      duration: Duration(seconds: 3),
                    ),
                  );
                }
              },
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.email_rounded, size: 150, color: Colors.white),
                    const SizedBox(height: 20),
                    const Text(textMessageResend,
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: isCooldown ? null : _resendEmail,
                      child: isCooldown ? const Text("Wait 60s...") : Text
                        ("Resend Email again",
                        style: TextStyle(color: Colors
                          .black),),
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