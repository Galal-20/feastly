import 'package:firebase_auth/firebase_auth.dart';

class ProfileDataSource {
  final FirebaseAuth firebaseAuth;

  ProfileDataSource({required this.firebaseAuth});

  Future<void> updateProfile({
    required String fullName,
  }) async {
    final user = firebaseAuth.currentUser;
    if (user != null) {
      await user.updateDisplayName(fullName);
      await user.reload();
    } else {
      throw Exception("User is null.");
    }
  }
}
