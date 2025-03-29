

import 'package:dartz/dartz.dart';
import 'package:feastly/src/features/home/domain/entities/recommended_for_you_section/recommended_for_you_entity.dart';
import 'package:feastly/src/features/home/domain/repositories/recommended_for_you_section/recommended_for_you_repository.dart';

import '../../../../../core/error/failures.dart';
import '../../../../ai_chat/domain/use_case/get_image_use_case.dart';
import '../../../data/models/recommended_for_you_model/recommended_meal_model.dart';

class GetRecommendedMealsUseCase {
  final RecommendedForYouRepository recommendedForYouRepository;
  final GetImageUseCase getImageUseCase;

  GetRecommendedMealsUseCase({required this.recommendedForYouRepository, required this.getImageUseCase});

  Future<Either<Failures, RecommendedForYouEntity>> call() async {
    final result = await recommendedForYouRepository.getRecommendedMeals();
    print('this is from usecase meaalllll');
    print(result);
    return result.fold(
          (error) => Left(error),
          (response) async {
        List<RecommendedMeal> updatedMeals = await Future.wait(response.recommendedMeals.map((meal) async {

          final imageResult = await getImageUseCase.call(meal.foodTitle);
          return imageResult.fold(
                (error) => meal,
                (imageResponse) => meal.copyWith(imageUrl: imageResponse.imageUrl),
          );

        }));

        return Right(response.copyWith(recommendedMeals: updatedMeals));
      },
    );
  }
}