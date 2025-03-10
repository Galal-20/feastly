

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/AuthRepository.dart';
import 'AuthEvent.dart';
import 'AuthState.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _authRepository;

  AuthBloc({required AuthRepository authRepository})
      : _authRepository = authRepository,
        super(AuthInitial()) {
    on<SignUpRequest>(_onSignUpRequested);
    on<LoginRequest>(_onLoginRequested);
    on<LogoutRequested>(_onLogoutRequested);
    on<AutoLoginRequested>(_onAutoLoginRequested);
  }

  Future<void> _onSignUpRequested(
      SignUpRequest event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      final user = await _authRepository.signUp(
        fullName: event.fullName,
        email: event.email,
        phone: event.phone,
        password: event.password,
      );

      /*emit(Authenticated(
        displayName: user?.displayName ?? event.fullName,
        email: event.email,
      ));*/

      if (user != null) {
        await _authRepository.sendEmailVerification(); // Send verification email
        emit(AuthError(
            message:
            "A verification email has been sent. Please verify before logging in."));
      } else {
        emit(AuthError(message: "Sign-up failed. Please try again."));
      }

    } catch (e) {
      emit(AuthError(message: e.toString()));
    }
  }

  Future<void> _onLoginRequested(
      LoginRequest event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      final user = await _authRepository.logIn(
        email: event.email,
        password: event.password,
      );

      if (user != null && user.emailVerified) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setBool("isLoggedIn", true);
        await prefs.setString("email", event.email);
        await prefs.setString("displayName", user.displayName ?? "User");

        emit(Authenticated(
          displayName: user.displayName ?? "User",
          email: event.email,
        ));
      } else {
        emit(AuthError(
            message:
            "Your email is not verified. Please verify it before logging in."));
      }
      /*SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setBool("isLoggedIn", true);
      await prefs.setString("email", event.email);
      await prefs.setString("displayName", user?.displayName ?? "User");

      emit(Authenticated(
        displayName: user?.displayName ?? "User",
        email: event.email,
      ));*/
    } catch (e) {
      emit(AuthError(message: e.toString()));
    }
  }

  Future<void> _onLogoutRequested(
      LogoutRequested event, Emitter<AuthState> emit) async {
    await _authRepository.logOut();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove("isLoggedIn");
    await prefs.remove("email");
    await prefs.remove("displayName");
    await prefs.clear();
    emit(Unauthenticated());
  }

  Future<void> _onAutoLoginRequested(
      AutoLoginRequested event, Emitter<AuthState> emit) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? email = prefs.getString("email");
    String? displayName = prefs.getString("displayName");

    if (email != null) {
      emit(Authenticated(displayName: displayName ?? "User", email: email));
    } else {
      emit(Unauthenticated());
    }
  }
}