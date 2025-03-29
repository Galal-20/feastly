import 'package:dartz/dartz.dart';
import 'package:feastly/src/core/error/failures.dart';
import 'package:feastly/src/features/ai_chat/domain/entities/image_enitiy.dart';

abstract class GetImageRepo {
  Future<Either<Failures, ImageEnitiy>> getImage(String query);
}
