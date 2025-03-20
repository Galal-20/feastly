import 'package:dartz/dartz.dart';
import 'package:feastly/src/core/error/failures.dart';
import 'package:feastly/src/features/mealDetails/domain/entities/meal_entity.dart';

abstract class GetMealDetailsRepository {
  Future<Either<Failure,MealEntity>> getMealDetails({required int id});
}