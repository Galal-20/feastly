import 'package:dartz/dartz.dart';
import 'package:feastly/src/core/error/failures.dart';
import 'package:feastly/src/features/profile/domain/entities/user_entity.dart';

import '../repositories/profile_repo.dart';

class GetProfileDataUseCase {
  final ProfileRepo repository;

  GetProfileDataUseCase({required this.repository});

  Future<Either<Failures, UserEntity>> call() async {
    return await repository.getUserProfile();
  }
}
