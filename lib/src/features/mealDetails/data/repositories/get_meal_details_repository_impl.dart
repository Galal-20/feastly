import 'package:dartz/dartz.dart';
import 'package:feastly/src/core/error/failures.dart';
import 'package:feastly/src/features/mealDetails/domain/entities/meal_entity.dart';
import 'package:feastly/src/features/mealDetails/domain/repositories/get_meal_details_repository.dart';

class GetMealDetailsRepositoryImpl implements GetMealDetailsRepository{
  @override
  Future<Either<Failure, MealEntity>> getMealDetails({required int id}) {
    // TODO: implement getMealDetails
    throw UnimplementedError();
  }

}