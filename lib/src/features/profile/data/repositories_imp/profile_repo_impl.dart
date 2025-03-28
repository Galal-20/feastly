import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:feastly/src/core/error/failures.dart';
import 'package:feastly/src/features/profile/data/data_sources/profile_data_source.dart';
import 'package:feastly/src/features/profile/data/models/user.dart';
import 'package:feastly/src/features/profile/domain/entities/user_entity.dart';
import 'package:feastly/src/features/profile/domain/repositories/profile_repo.dart';

class ProfileRepoImpl implements ProfileRepo {
  final ProfileDataSource profileDataSource;
  ProfileRepoImpl({required this.profileDataSource});
  @override
  Future<Either<Failures, Unit>> updateProfileDetails(
      {required UserEntity user, File? file}) async {
    try {
       await profileDataSource.updateProfile(
        userModel: UserModel(
          name: user.name,
          phone: user.phone,
          email: user.email,
          image: user.image,
        ),
        file: file,
      );
      return Right(unit);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
  
  @override
  Future<Either<Failures, UserEntity>> getUserProfile() async {
    try {
      final user = await profileDataSource.getUserProfile();
      return right(user);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
