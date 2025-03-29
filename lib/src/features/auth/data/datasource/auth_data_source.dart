import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/firebase/firebase_auth_service.dart';

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




class AuthRepository implements AuthDataSource {
  final FirebaseHelper _firebaseAuthService;

  AuthRepository({required FirebaseHelper firebaseAuthService})
      : _firebaseAuthService = firebaseAuthService;

  @override
  Future<User?> signUp({
    required String fullName,
    required String email,
    required String phone,
    required String password,
  }) {
    return _firebaseAuthService.signUp(
      fullName: fullName,
      email: email,
      phone: phone,
      password: password,

    );
  }


  @override
  Future<void> sendEmailVerification() {
    return _firebaseAuthService.sendEmailVerification();
  }

  @override
  Future<User?> logIn({
    required String email,
    required String password,
  }) {
    return _firebaseAuthService.logIn(
      email: email,
      password: password,
    );
  }

  @override
  Future<void> logOut() async {
    await _firebaseAuthService.logOut();
  }

  @override
  User? getCurrentUser() {
    return _firebaseAuthService.getCurrentUser();
  }

  @override
  Future<User?> signInWithGoogle() {
    return _firebaseAuthService.signInWithGoogle();
  }


}



