import 'package:feastly/src/core/constants/strings.dart';
import 'package:feastly/src/core/helper/shared_prefrences_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../data/datasource/auth_data_source.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthDataSource _authDataSource;


  AuthBloc({required AuthDataSource authRepository})
      : _authDataSource = authRepository,
        super(AuthInitial()) {
    on<SignUpRequest>(_onSignUpRequested);
    on<LoginRequest>(_onLoginRequested);
    on<LogoutRequested>(_onSignOutRequested);
    on<AutoLoginRequested>(_onAutoLoginRequested);
    on<GoogleSignInRequested>(_onGoogleSignInRequested);
    on<ResendEmailVerification>(_onResendEmailVerification);
    on<CheckEmailVerification>(_onCheckEmailVerification);
  }

  Future<void> _onSignUpRequested(
      SignUpRequest event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      final user = await _authDataSource.signUp(
        fullName: event.fullName,
        email: event.email,
        phone: event.phone,
        password: event.password,
      );

      if (user != null) {
        await _sendEmailVerification(emit);
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
      final user = await _authDataSource.logIn(
        email: event.email,
        password: event.password,
      );

      if (user != null) {
        await user.reload(); // Reload the user to get the latest status

        if (!user.emailVerified) {
          await _sendEmailVerification(emit);
        } else {
          //await _saveUserSession(event.email, user.displayName);
          emit(Authenticated(
            displayName: user.displayName ?? "User",
            email: event.email,
          ));
          saveLoginStatus(status: true);
        }
      } else {
        emit(AuthError(message: "Login failed. Please try again."));
      }
    } catch (e) {
      emit(AuthError(message: e.toString()));
    }
  }

  void saveLoginStatus({required bool status}) {
    SharedPreferencesHelper.saveBool(AppStrings.userLoggedInKey, status);
  }

  // make sure use this method in profile ya Hossam
  Future<void> _onSignOutRequested(
      AuthEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    await _authDataSource.logOut();
    await _clearPreferences();
    emit(Unauthenticated());
  }

  Future<void> _onAutoLoginRequested(
      AutoLoginRequested event, Emitter<AuthState> emit) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? email = prefs.getString("email");
    String? displayName = prefs.getString("displayName");

    if (email != null) {
      emit(Authenticated(displayName: displayName ?? "User", email: email));
      saveLoginStatus(status: true);
    } else {
      emit(Unauthenticated());
    }
  }

  Future<void> _onGoogleSignInRequested(
      GoogleSignInRequested event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      final user = await _authDataSource.signInWithGoogle();

      if (user != null) {
        //await _saveUserSession(user.email, user.displayName);
        emit(Authenticated(
          displayName: user.displayName ?? "User",
          email: user.email ?? "",
        ));
        saveLoginStatus(status: true);
      } else {
        emit(AuthError(message: "Google sign-in failed. Try again."));
      }
    } catch (e) {
      emit(AuthError(message: e.toString()));
    }
  }

  Future<void> _sendEmailVerification(Emitter<AuthState> emit) async {
    try {
      debugPrint("Attempting to send verification email...");
      await _authDataSource.sendEmailVerification();
      debugPrint("Verification email sent successfully!");

      emit(VerificationEmailSent(
          message:
              "A verification email has been sent. Please check your inbox."));
    } catch (e) {
      debugPrint("Error sending email verification: $e");
      emit(AuthError(
          message: "Failed to resend verification email. Please try again."));
    }
  }

  Future<void> _onResendEmailVerification(
      ResendEmailVerification event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      await _sendEmailVerification(emit);
    } catch (e) {
      emit(AuthError(
          message: "Failed to resend verification email. Please try again."));
    }
  }

  /*Future<void> _saveUserSession(String? email, String? displayName) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool("isLoggedIn", true);
    await prefs.setString("email", email ?? "");
    await prefs.setString("displayName", displayName ?? "User");
  }*/

  // Future<void> _saveUserSession(String? email, String? displayName) async {
  //   final prefs = await SharedPreferences.getInstance();
  //   await prefs.setBool("isLoggedIn", true);
  //   await prefs.setString("email", email ?? "");
  //   await prefs.setString("displayName", displayName ?? "User");
  // }

  Future<void> _clearPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(AppStrings.rememberMeKey, false);
    await prefs.clear();
  }

  Future<void> _onCheckEmailVerification(
      CheckEmailVerification event, Emitter<AuthState> emit) async {
    emit(AuthLoading());

    try {
      final user = _authDataSource.getCurrentUser();
      await user?.reload();
      if (user != null && user.emailVerified) {
        final prefs = await SharedPreferences.getInstance();
        await prefs.setBool(AppStrings.isVerifiedKey, true);
        emit(EmailVerified());
      }
    } catch (e) {
      emit(AuthError(message: "Failed to check verification status."));
    }
  }
}
