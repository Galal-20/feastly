import 'package:feastly/src/features/profile/domain/repositories/profile_repo.dart';

class ProfileUpdateNameUseCase {
  final ProfileRepo repository;

  ProfileUpdateNameUseCase({required this.repository});

  Future<void> call(String name) async {
    return repository.updateName(name);
  }
}
