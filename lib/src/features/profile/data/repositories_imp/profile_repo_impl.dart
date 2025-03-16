import 'package:dartz/dartz.dart';
import 'package:feastly/src/features/profile/data/data_sources/profile_data_source.dart';
import 'package:feastly/src/features/profile/domain/repositories/profile_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProfileRepoImpl extends ProfileRepo {
  final ProfileDataSource profileDataSource;

  ProfileRepoImpl({required this.profileDataSource});

  @override
  Future< User> getUserProfile() async{
    try {
    final  user=  await profileDataSource.getUserProfile();

    return user;

    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<void> updateName(String fullName) async {
    try {
      await profileDataSource.updateProfile(fullName: fullName);
    } catch (e) {
      throw Exception(e);
    }
  }
}
