import 'package:feastly/src/core/auth/firebase_auth_service.dart';
import 'package:feastly/src/features/auth/data/datasource/AuthRepository.dart';

class ProfileDataSource {
  final AuthRepository authRepository;

  ProfileDataSource({required this.authRepository});

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
