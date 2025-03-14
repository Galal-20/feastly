import 'package:feastly/src/features/profile/data/data_sources/profile_data_source.dart';
import 'package:feastly/src/features/profile/domain/repositories/profile_repo.dart';

class ProfileRepoImpl extends ProfileRepo {
  final ProfileDataSource profileDataSource;

  ProfileRepoImpl({required this.profileDataSource});
  @override
  Future<void> updateName(String fullName) async {
    try {
      await profileDataSource.updateProfile(fullName: fullName);
    } catch (e) {
      throw Exception(e);
    }
  }
}
