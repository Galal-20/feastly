import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/components/button.dart';
import '../../../../core/components/text_form_field.dart';
import '../../../../core/utils/validations.dart';
import '../../../home/presentation/screens/HomeScreen.dart';
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
  bool _isLoading = false;
  bool _isPasswordHidden = true;

  void _onLoginPressed() {
    if (_formKey.currentState!.validate()) {
      BlocProvider.of<AuthBloc>(context).add(
        LoginRequest(email: _email, password: _password),
      );
      _saveLoginState();
    }
  }

  void _saveLoginState() async {
    final prefs = await SharedPreferences.getInstance();

    if (_rememberMe) {
      await prefs.setBool('isLoggedIn', true);
    } else {
      await prefs.setBool('isLoggedIn', false);
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Reminder'),
          content: const Text('You will need to log in again next time.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthLoading) {
          setState(() => _isLoading = true);
        } else {
          setState(() => _isLoading = false);
        }

        if (state is Authenticated) {
          Navigator.pushReplacementNamed(context, '/home');
        }

        if (state is AuthError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message)),
          );
        }
      },
      child: Scaffold(
        backgroundColor: const Color(0xff001A3F),
        body: Stack(
          children: [
            Positioned.fill(
              child: Opacity(
                opacity: 0.9,
                child: Image.asset(
                  'assets/images/bg.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SafeArea(
              child: Center(
                child: SingleChildScrollView(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 40),
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 2),
                        ),
                        child: Image.asset(
                          'assets/images/chef_hat.png',
                          width: 80,
                          height: 80,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(height: 40),
                      Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            TextFieldClass.buildTextFormField(
                              labelText: 'Email',
                              hintText: 'Enter your email',
                              radius: 20,
                              textStyle: const TextStyle(color: Colors.white),
                              hintStyle: const TextStyle(color: Colors.white70),
                              prefixIcon:
                                  const Icon(Icons.email, color: Colors.white),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your email';
                                } else if (!Validation.isValidateEmail(value)) {
                                  return 'Enter a valid email';
                                }
                                return null;
                              },
                              onChanged: (value) =>
                                  setState(() => _email = value),
                            ),
                            const SizedBox(height: 20),
                            TextFieldClass.buildTextFormField(
                              labelText: 'Password',
                              hintText: 'Enter your password',
                              radius: 20,
                              textStyle: const TextStyle(color: Colors.white),
                              hintStyle: const TextStyle(color: Colors.white70),
                              prefixIcon:
                                  const Icon(Icons.lock, color: Colors.white),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    _isPasswordHidden = !_isPasswordHidden;
                                  });
                                },
                                icon: Icon(_isPasswordHidden
                                    ? Icons.visibility_off
                                    : Icons.visibility),
                              ),
                              obscureText: _isPasswordHidden,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your password';
                                } else if (!Validation.isValidatePassword(
                                    value)) {
                                  return 'Password is too weak';
                                }
                                return null;
                              },
                              onChanged: (value) =>
                                  setState(() => _password = value),
                            ),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                Checkbox(
                                  value: _rememberMe,
                                  onChanged: (value) {
                                    setState(() => _rememberMe = value!);
                                    if (_rememberMe) {
                                      context
                                          .read<AuthBloc>()
                                          .add(AutoLoginRequested());
                                    } else {
                                      _saveLoginState();
                                      Navigator.of(context).pushReplacement(
                                        MaterialPageRoute(
                                            builder: (context) => HomeScreen()),
                                      );
                                    }
                                  },
                                  activeColor: Colors.white,
                                  checkColor: Colors.black,
                                ),
                                const Text(
                                  'Remember Me',
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
                              text: 'Login',
                              onPressed: _onLoginPressed,
                            ),
                            const SizedBox(height: 20),
                            GestureDetector(
                              onTap: () {
                                BlocProvider.of<AuthBloc>(context)
                                    .add(GoogleSignInRequested());
                              },
                              child: Container(
                                padding: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.4),
                                      blurRadius: 4,
                                      offset: const Offset(2, 2),
                                    ),
                                  ],
                                ),
                                child: Image.asset(
                                  'assets/images/googleLogo.png',
                                  width: 30,
                                  height: 30,
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  "Don't have an account?",
                                  style: TextStyle(color: Colors.white70),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.pushNamed(context, '/register');
                                  },
                                  child: const Text(
                                    'Sign Up',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
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
