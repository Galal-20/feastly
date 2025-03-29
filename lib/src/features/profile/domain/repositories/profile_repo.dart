import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:feastly/src/core/error/failures.dart';
import 'package:feastly/src/features/profile/domain/entities/user_entity.dart';

abstract class ProfileRepo {
  Future<Either<Failures, Unit>> updateProfileDetails(
      {required UserEntity user, File? file});
  Future<Either<Failures, UserEntity>> getUserProfile();
}
