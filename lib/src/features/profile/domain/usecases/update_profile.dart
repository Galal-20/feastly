import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:feastly/src/core/error/failures.dart';
import 'package:feastly/src/features/profile/domain/entities/user_entity.dart';
import 'package:feastly/src/features/profile/domain/repositories/profile_repo.dart';

class ProfileUpdateNameUseCase {
  final ProfileRepo repository;

  ProfileUpdateNameUseCase({required this.repository});

  Future<Either<Failures, Unit>> call(
      {required UserEntity user, File? file}) async {
    return await repository.updateProfileDetails(user: user, file: file);
  }
}
