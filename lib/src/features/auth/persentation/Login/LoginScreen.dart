import 'package:feastly/src/core/functions/functions.dart';
import 'package:feastly/src/features/auth/persentation/SIgnUp/SignUpScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/components/button.dart';
import '../../../../core/components/text_form_field.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/constants/images.dart';
import '../../../../core/constants/strings.dart';
import '../../../../core/utils/validations.dart';
import '../AuthBloc/AuthBloc.dart';
import '../AuthBloc/AuthEvent.dart';
import '../AuthBloc/AuthState.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _email = '';
  String _password = '';
  bool _rememberMe = false;
  final bool _isLoading = false;
  bool _isPasswordHidden = true;

  @override
  void initState() {
    super.initState();
    _loadRememberMeState();
  }

  // Load saved 'Remember Me' state from SharedPreferences
  Future<void> _loadRememberMeState() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _rememberMe = prefs.getBool('rememberMe') ?? false;
    });
    if (!_rememberMe) {
      await prefs.remove('email');
    }
  }

  // Save login state if 'Remember Me' is checked
  Future<void> _saveLoginState() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('rememberMe', _rememberMe);
    if (_rememberMe) {
      await prefs.setString('email', _email);
    }else{
      await prefs.remove('email');
    }
  }

  // Handle login button press
  void _onLoginPressed() {
    if (_formKey.currentState!.validate()) {
      BlocProvider.of<AuthBloc>(context).add(
        LoginRequest(email: _email, password: _password),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) async {
        if (state is AuthLoading) {
          CircularProgressIndicator();
        }else if (state is Authenticated) {
          if (_rememberMe) {
            // After make Home Screen make this line.
            //SharedFunctions.pushAndRemoveUntil(context, HomeScreen());
          }else{
            // After make Home Screen make this line.
            // SharedFunctions.pushAndRemoveUntil(context, HomeScreen());
          }

        }else  if (state is AuthError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message)),
          );
        }
      },
      child: Scaffold(
        backgroundColor: splashColor,
        body:
        Stack(
          children: [
            background_form(),
            SafeArea(
              child: Center(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                  child:
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 40),
                      logo_app(),
                      const SizedBox(height: 40),
                      Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            TextFieldClass.buildTextFormField(
                              labelText: labelTextEmail,
                              hintText: hintEmailText,
                              radius: 20,
                              textStyle: const TextStyle(color: Colors.white),
                              hintStyle: const TextStyle(color: Colors.white70),
                              prefixIcon: const Icon(Icons.email, color: Colors.white),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return errorEmailText;
                                } else if (!Validation.isValidateEmail(value)) {
                                  return errorEmailValid;
                                }
                                return null;
                              },
                              onChanged: (value) => setState(() => _email = value),
                            ),
                            const SizedBox(height: 20),
                            TextFieldClass.buildTextFormField(
                              labelText: labelTextPass,
                              hintText: hintPassText,
                              radius: 20,
                              textStyle: const TextStyle(color: Colors.white),
                              hintStyle: const TextStyle(color: Colors.white70),
                              prefixIcon: const Icon(Icons.lock, color: Colors.white),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    _isPasswordHidden = !_isPasswordHidden;
                                  });
                                },
                                icon: Icon(_isPasswordHidden ? Icons.visibility_off : Icons.visibility),
                              ),
                              obscureText: _isPasswordHidden,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return errorPassText;
                                } else if (!Validation.isValidatePassword(value)) {
                                  return errorPassValid;
                                }
                                return null;
                              },
                              onChanged: (value) =>  _password = value,
                            ),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                Checkbox(
                                  value: _rememberMe,
                                  onChanged: (value) async {
                                    setState(() => _rememberMe = value!);
                                    await _saveLoginState();
                                  },
                                  activeColor: Colors.white,
                                  checkColor: Colors.black,
                                ),
                                const Text(
                                  loginCheckBoxText,
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            Button(
                              isLoading: _isLoading,
                              formKey: _formKey,
                              email: _email,
                              password: _password,
                              text: login,
                              onPressed: _onLoginPressed,
                            ),
                            const SizedBox(height: 20),
                          ],
                        ),
                      ),
                      googleButton(),
                      const SizedBox(height: 20),
                      footer_login(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}