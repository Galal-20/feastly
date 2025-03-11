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
    on<GoogleSignInRequested>(_onGoogleSignInRequested);
    on<SignOutRequested>(
          (SignOutRequested event, Emitter<AuthState> emit) async {
        await _onSignOutRequested(event, emit);
      },
    );
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

      if (user != null) {
        await _authRepository.sendEmailVerification();
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
  Future<void> _onLogoutRequested(
      LogoutRequested event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    await _authRepository.logOut();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    emit(Unauthenticated());
  }
  Future<void> _onLoginRequested(
      LoginRequest event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      final user = await _authRepository.logIn(
        email: event.email,
        password: event.password,
      );

      if (user != null) {
        if (!user.emailVerified) {
          await _authRepository.sendEmailVerification();
          emit(NeedsEmailVerification());
        } else {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          await prefs.setBool("isLoggedIn", true);
          await prefs.setString("email", event.email);
          await prefs.setString("displayName", user.displayName ?? "User");

          emit(Authenticated(
            displayName: user.displayName ?? "User",
            email: event.email,
          ));
        }
      } else {
        emit(AuthError(message: "Login failed. Please try again."));
      }
    } catch (e) {
      emit(AuthError(message: e.toString()));
    }
  }
  Future<void> _onSignOutRequested(
      SignOutRequested event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    await _authRepository.logOut();
    final prefs = await SharedPreferences.getInstance();
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
  Future<void> _onGoogleSignInRequested(
      GoogleSignInRequested event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      final user = await _authRepository.signInWithGoogle();

      if (user != null) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setBool("isLoggedIn", true);
        await prefs.setString("email", user.email ?? "");
        await prefs.setString("displayName", user.displayName ?? "User");

        emit(Authenticated(
          displayName: user.displayName ?? "User",
          email: user.email ?? "",
        ));
      } else {
        emit(AuthError(message: "Google sign-in failed. Try again."));
      }
    } catch (e) {
      emit(AuthError(message: e.toString()));
    }
  }
}
