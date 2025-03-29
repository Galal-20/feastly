import 'package:dartz/dartz.dart';
import 'package:feastly/src/core/error/failures.dart';
import 'package:feastly/src/features/ai_chat/data/data_source/image_remote_data_source.dart';
import 'package:feastly/src/features/ai_chat/data/models/ai_result_model/nutritional_information.dart';
import 'package:feastly/src/features/ai_chat/data/repos/get_image_repo_impl.dart';
import 'package:feastly/src/features/ai_chat/domain/use_case/get_image_use_case.dart';
import 'package:feastly/src/features/home/data/data_sources/recommended_for_you_section/recommended_for_you_remote_data_source.dart';
import 'package:feastly/src/features/home/data/data_sources/trending_recipes_section/trending_recipes_remote_data_source.dart';
import 'package:feastly/src/features/home/data/models/recommended_for_you_model/recommended_for_you_model.dart';
import 'package:feastly/src/features/home/data/models/recommended_for_you_model/recommended_meal_model.dart';
import 'package:feastly/src/features/home/data/models/trending_recipes_model/trending_meals_response.dart';
import 'package:feastly/src/features/home/data/models/trending_recipes_model/trending_recipes_response_model.dart';
import 'package:feastly/src/features/home/data/repositories_imp/recommended_for_you_section/recommended_for_you_repository_impl.dart';
import 'package:feastly/src/features/home/data/repositories_imp/trending_recipes_section/trending_recipes_repository_impl.dart';
import 'package:feastly/src/features/home/domain/usecases/recommended_for_you_section/recommended_for_you_usecase.dart';
import 'package:feastly/src/features/home/domain/usecases/trending_recipes_section/get_trending_recipes_usecase.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'home_use_case_test.mocks.dart';

@GenerateMocks([
  RecommendedForYouRemoteDataSource,
  TrendingRecipesRemoteDataSource,
  ImageRemoteDataSource
])
void main() {
  late GetRecommendedMealsUseCase getRecommendedMealsUseCase;
  late GetTrendingRecipesUseCase getTrendingRecipesUseCase;
  late GetImageUseCase getImageUseCase;
  late GetImageRepoImpl getImageRepoImpl;
  late RecommendedForYouRepositoryImpl recommendedForYouRepositoryImpl;
  late TrendingRecipesRepositoryImpl trendingRecipesRepositoryImpl;
  late MockImageRemoteDataSource mockImageRemoteDataSource;
  late MockRecommendedForYouRemoteDataSource
      mockRecommednedForYouRemoteDataSource;
  late MockTrendingRecipesRemoteDataSource mockTrendingRecipesRemoteDataSource;
  setUp(() {
    mockImageRemoteDataSource = MockImageRemoteDataSource();
    mockRecommednedForYouRemoteDataSource =
        MockRecommendedForYouRemoteDataSource();
    mockTrendingRecipesRemoteDataSource = MockTrendingRecipesRemoteDataSource();
    recommendedForYouRepositoryImpl = RecommendedForYouRepositoryImpl(
        recommendedForYouRemoteDataSource:
            mockRecommednedForYouRemoteDataSource);
    trendingRecipesRepositoryImpl = TrendingRecipesRepositoryImpl(
        trendingRecipesRemoteDataSource: mockTrendingRecipesRemoteDataSource);
    getImageRepoImpl =
        GetImageRepoImpl(imageRemoteDataSource: mockImageRemoteDataSource);
    getImageUseCase = GetImageUseCase(getImageRepo: getImageRepoImpl);
    getRecommendedMealsUseCase = GetRecommendedMealsUseCase(
        recommendedForYouRepository: recommendedForYouRepositoryImpl,
        getImageUseCase: getImageUseCase);
    getTrendingRecipesUseCase = GetTrendingRecipesUseCase(
        trendingRecipesRepository: trendingRecipesRepositoryImpl,
        getImageUseCase: getImageUseCase);
  });

  test(
    'Test Get Recommended Meals Success',
    () async {
      List<RecommendedMeal> recommendedMeals = [
        RecommendedMeal(
          foodTitle: 'test',
          imageUrl: 'test',
          cookingTime: 'test',
          numberOfIngredients: 'test',
          servings: 'test',
          ratings: 'test',
          summary: 'test',
          typeOfMeat: 'test',
          nutritionalInfo: NutritionalInformation(
            carbs: 'test',
            protein: 'test',
            fats: 'test',
            kcal: 'test',
            vitamins: 'test',
          ),
          ingredients: [],
          directions: [],
        )
      ];
      final RecommendedForYouModel expectedResult = RecommendedForYouModel(
        recommendedMeals: recommendedMeals,
      );

      when(mockRecommednedForYouRemoteDataSource.getRecommendedMeals())
          .thenAnswer(
        (_) async => expectedResult,
      );

      final result = await getRecommendedMealsUseCase.call();

      verify(mockRecommednedForYouRemoteDataSource.getRecommendedMeals())
          .called(1);

      expect(result, Right<Failures, RecommendedForYouModel>(expectedResult));
    },
  );
  test(
    'Test Get Trending Meals Success',
    () async {
      List<TrendingMeal> trendingMeals = [
        TrendingMeal(
          foodTitle: 'test',
          imageUrl: 'test',
          cookingTime: 'test',
          numberOfIngredients: 'test',
          servings: 'test',
          summary: 'test',
          typeOfMeat: 'test',
          nutritionalInfo: NutritionalInformation(
            carbs: 'test',
            protein: 'test',
            fats: 'test',
            kcal: 'test',
            vitamins: 'test',
          ),
          ingredients: [],
          directions: [],
        )
      ];
      final TrendingRecipesResponseModel expectedResult =
          TrendingRecipesResponseModel(
        trendingMeals: trendingMeals,
      );

      when(mockTrendingRecipesRemoteDataSource.getTrendingRecipes()).thenAnswer(
        (_) async => expectedResult,
      );

      final result = await getTrendingRecipesUseCase.call();

      verify(mockTrendingRecipesRemoteDataSource.getTrendingRecipes())
          .called(1);

      expect(result,
          Right<Failures, TrendingRecipesResponseModel>(expectedResult));
    },
  );
  test(
    'Test Get Trending Meals Fail',
    () async {
      final GeminiException geminiException = GeminiException(
        'Failed To Get Result',
      );

      final GeminiFailures geminiFailures =
          GeminiFailures(message: geminiException.message.toString());

      when(mockTrendingRecipesRemoteDataSource.getTrendingRecipes()).thenThrow(
        geminiException,
      );

      final result = await getTrendingRecipesUseCase.call();

      verify(mockTrendingRecipesRemoteDataSource.getTrendingRecipes())
          .called(1);

      expect(
          result, Left<Failures, TrendingRecipesResponseModel>(geminiFailures));
    },
  );
  test(
    'Test Get Recommended Meals Fail',
    () async {
      final GeminiException geminiException = GeminiException(
        'Failed To Get Result',
      );

      final GeminiFailures geminiFailures =
          GeminiFailures(message: geminiException.message.toString());

      when(mockRecommednedForYouRemoteDataSource.getRecommendedMeals())
          .thenThrow(
        geminiException,
      );

      final result = await getRecommendedMealsUseCase.call();

      verify(mockRecommednedForYouRemoteDataSource.getRecommendedMeals())
          .called(1);

      expect(result, Left<Failures, RecommendedForYouModel>(geminiFailures));
    },
  );
}
