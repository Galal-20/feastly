
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/AuthRepository.dart';
import 'AuthState.dart';

abstract class AuthEvent {}

class SignUpRequest extends AuthEvent {
  final String fullName;
  final String email;
  final String phone;
  final String password;

  SignUpRequest({
    required this.fullName,
    required this.email,
    required this.phone,
    required this.password,
  });
}

class LoginRequest extends AuthEvent {
  final String email;
  final String password;


  LoginRequest({
    required this.email,
    required this.password,
  });
}

class LogoutRequested extends AuthEvent {}

class AutoLoginRequested extends AuthEvent {}

class GoogleSignInRequested extends AuthEvent {}

class CheckEmailVerification extends AuthEvent {}

class ResendEmailVerification extends AuthEvent {}


