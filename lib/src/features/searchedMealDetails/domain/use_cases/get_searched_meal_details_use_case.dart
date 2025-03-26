import 'package:dartz/dartz.dart';
import 'package:feastly/src/core/error/failures.dart';
import 'package:feastly/src/features/searchedMealDetails/domain/entities/meal_entity.dart';
import 'package:feastly/src/features/searchedMealDetails/domain/repositories/get_searched_meal_details_repository.dart';

class GetSearchedMealDetailsUseCase {
  final GetSearchedMealDetailsRepository getSearchedMealDetailsRepository;

  GetSearchedMealDetailsUseCase({required this.getSearchedMealDetailsRepository});

  Future<Either<Failures, MealEntity>> call({required String id}) async {
    return await getSearchedMealDetailsRepository.getSearchedMealDetails(id: id);
  }
}
