import 'package:feastly/src/features/auth/data/datasource/AuthRepository.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../auth/data/datasource/auth_data_source.dart';

class ProfileDataSource {
  final AuthRepository authRepository;

  ProfileDataSource({required this.authRepository});

  Future<User> getUserProfile() async {
    try {
      final User  user =  authRepository.getCurrentUser() as User;

      return user;

    } on FirebaseAuthException  catch (e) {
      throw Exception(e.message);
    }
  }


  Future<void> updateProfile({
    required String fullName,
  }) async {
    final user = authRepository.getCurrentUser();
    if (user != null) {
      await user.updateDisplayName(fullName);
      await user.reload();
    } else {
      throw Exception("User is null.");
    }
  }
}
