import 'package:firebase_auth/firebase_auth.dart';

import '../repositories/profile_repo.dart';

class GetProfileDataUseCase {
  final ProfileRepo repository;

  GetProfileDataUseCase({required this.repository});


  Future<User> call() async {
    return repository.getUserProfile();
  }
}