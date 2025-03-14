import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthDataSource {
  Future<User?> signUp({
    required String fullName,
    required String email,
    required String phone,
    required String password,
  });

  Future<void> sendEmailVerification();

  Future<User?> logIn({
    required String email,
    required String password,
  });

  Future<User?> signInWithGoogle();

  Future<void> logOut();

  User? getCurrentUser();
}
