import 'package:dartz/dartz.dart';
import 'package:feastly/src/features/home/domain/entities/recommended_for_you_section/recommended_for_you_entity.dart';
import '../../../../../core/error/failures.dart';

abstract class RecommendedForYouRepository{
  Future<Either<Failures, RecommendedForYouEntity>> getRecommendedMeals();

}