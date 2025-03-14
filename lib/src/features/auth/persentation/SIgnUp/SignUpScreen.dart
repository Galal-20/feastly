import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/components/text_form_field.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/constants/strings.dart';
import '../../../../core/functions/functions.dart';
import '../../../../core/utils/validations.dart';
import '../AuthBloc/AuthBloc.dart';
import '../AuthBloc/AuthEvent.dart';
import '../AuthBloc/AuthState.dart';
import '../verification/verification_screen.dart';
import '../widget/background_from_widget.dart';
import '../widget/footer_signUp_widget.dart';
import '../widget/google_button_widget.dart';
import '../widget/logo_app_widget.dart';
import '../widget/or_login_now_widget.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  String fullNameController =" ", emailController =" ", phoneController =" ", passwordController =" " ;


  bool agreeToTerms = false;
  bool _isPasswordHidden = true;




  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: splashColor,
        body: Stack(
          children: [
            background_form(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: BlocConsumer<AuthBloc, AuthState>(
                listener: (context, state) {
                  if (state is VerificationEmailSent) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(state.message)),
                    );
                    if (state.message.contains('verification')) {
                      SharedFunctions.pushAndRemoveUntil(context, VerificationScreen());
                    }
                  }
                },
                builder: (context, state) {
                  return Center(
                    child: SingleChildScrollView(
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            logo_app(),
                            const SizedBox(height: 30),
                            TextFieldClass.buildTextFormField(
                              labelText: fullName,
                              hintText: hintFullName,
                              radius: 20,
                              textStyle: TextStyle(color: Colors.white),
                              hintStyle: TextStyle(color: Colors.grey),
                              prefixIcon: Icon(Icons.person, color: Colors.white),
                              onChanged: (value) => fullNameController = value,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return errorFullName;
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 20),
                            TextFieldClass.buildTextFormField(
                              labelText: email,
                              hintText: hintEmail,
                              radius: 20,
                              textStyle: TextStyle(color: Colors.white),
                              hintStyle: TextStyle(color: Colors.grey),
                              prefixIcon: Icon(Icons.email, color: Colors.white),
                              onChanged: (value) => emailController = value ,
                              validator: (value) {
                                if (value == null || value.isEmpty || !Validation.isValidateEmail(value)) {
                                  return errorEmail;
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 20),
                            TextFieldClass.buildTextFormField(
                              labelText: phone,
                              hintText: hintPhone,
                              radius: 20,
                              textStyle: TextStyle(color: Colors.white),
                              hintStyle: TextStyle(color: Colors.grey),
                              prefixIcon: Icon(Icons.phone, color: Colors.white),
                              onChanged: (value) => phoneController = value,
                              validator: (value) {
                                if (value == null || value.isEmpty || !Validation.isValidPhone(value)) {
                                  return errorPhone;
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 20),
                            TextFieldClass.buildTextFormField(
                              labelText: password,
                              hintText: hintPassword,
                              radius: 20,
                              textStyle: TextStyle(color: Colors.white),
                              hintStyle: TextStyle(color: Colors.grey),
                              onChanged: (value) => passwordController = value,
                              prefixIcon: Icon(Icons.lock, color: Colors.white),
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
                                if (value == null || value.isEmpty || !Validation.isValidatePassword(value)) {
                                  return errorPassword;
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 20),
                            Row(
                              children: [
                                Checkbox(
                                  value: agreeToTerms,
                                  activeColor: Colors.white,
                                  checkColor: splashColor,
                                  onChanged: (value) {
                                    setState(() {
                                      agreeToTerms = value!;
                                    });
                                  },
                                ),
                                const Expanded(
                                  child: Text(
                                    condition,
                                    style: TextStyle(color: Colors.white, fontSize: 12),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            ElevatedButton(
                              onPressed: (state is AuthLoading || !agreeToTerms)
                                  ? null
                                  : () {
                                if (_formKey.currentState!.validate()) {
                                  BlocProvider.of<AuthBloc>(context).add(
                                    SignUpRequest(
                                      fullName: fullNameController,
                                      email: emailController,
                                      phone: phoneController,
                                      password: passwordController,
                                    ),
                                  );
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                foregroundColor: splashColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                minimumSize: const Size(double.infinity, 50),
                              ),
                              child: state is AuthLoading
                                  ? const CircularProgressIndicator()
                                  : const Text(
                                register,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            const SizedBox(height: 20),
                            or_login_now(),
                            const SizedBox(height: 20),
                            googleButton(),
                            const SizedBox(height: 20),
                            footer_signUp(),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

