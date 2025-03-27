import 'package:dartz/dartz.dart';
import 'package:feastly/src/core/error/failures.dart';
import 'package:feastly/src/features/searchedMealDetails/domain/entities/meal_entity.dart';

abstract class GetSearchedMealDetailsRepository {
  Future<Either<Failures,MealEntity>> getSearchedMealDetails({required String id});
}