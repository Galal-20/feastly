import 'package:dartz/dartz.dart';
import 'package:feastly/src/core/error/failures.dart';
import 'package:feastly/src/features/foodDetails/domain/entities/meal_entity.dart';
import 'package:feastly/src/features/foodDetails/domain/repositories/get_meal_details_repository.dart';

class GetMealDetailsUseCase {
  final GetMealDetailsRepository getMealDetailsRepository;

  GetMealDetailsUseCase({required this.getMealDetailsRepository});

  Future<Either<Failure, MealEntity>> call({required String id}) async {
    return await getMealDetailsRepository.getMealDetails(id: id);
  }
}
