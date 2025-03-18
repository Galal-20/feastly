import 'package:dartz/dartz.dart';
import 'package:feastly/src/core/error/failures.dart';

abstract class UseCase<Type, Param> {
  Future<Either<Failures, Type>> call([Param param]);
}

class NoParam {}
