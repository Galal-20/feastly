

import 'package:dartz/dartz.dart';
import 'package:feastly/src/features/home/domain/entities/trending_recipes_section/trending_recipes_entity.dart';

import '../../../../../core/error/failures.dart';
import '../../../../ai_chat/domain/use_case/get_image_use_case.dart';
import '../../../data/models/trending_recipes_model/trending_meals_response.dart';
import '../../repositories/trending_recipes_section/trending_recipes_repository.dart';

class GetTrendingRecipesUseCase {
  final TrendingRecipesRepository trendingRecipesRepository;
  final GetImageUseCase getImageUseCase;

  GetTrendingRecipesUseCase({required this.trendingRecipesRepository, required this.getImageUseCase});

  Future<Either<Failures, TrendingRecipesEntity>> call() async {
    final result = await trendingRecipesRepository.getTrendingRecipes();

    return result.fold(
          (error) => Left(error),
          (response) async {
        List<TrendingMeal> updatedMeals = await Future.wait(response.trendingMeals.map((meal) async {
          final imageResult = await getImageUseCase.call(meal.foodTitle);
          return imageResult.fold(
                (error) => meal,
                (imageResponse) => meal.copyWith(imageUrl: imageResponse.imageUrl),
          );
        }));

        return Right(response.copyWith(trendingMeals: updatedMeals));
      },
    );
  }
}