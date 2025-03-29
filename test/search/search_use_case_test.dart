import 'package:dio/dio.dart';
import 'package:feastly/src/features/foodDetails/data/models/meal.dart';
import 'package:feastly/src/features/foodDetails/domain/entities/meal_entity.dart';
import 'package:feastly/src/features/search/data/data_sources/RecipeRemote.dart';
import 'package:feastly/src/features/search/data/repositories_imp/RecipeRepositoryImpl.dart';
import 'package:feastly/src/features/search/domain/usecases/uaseCase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'search_use_case_test.mocks.dart';

@GenerateMocks([RecipeRemoteDataSource])
void main() {
  late SearchUseCase searchUseCase;
  late RecipeRepositoryImpl recipeRepoImpl;
  late MockRecipeRemoteDataSource mockRecipeRemoteDataSource;
  setUp(() {
    mockRecipeRemoteDataSource = MockRecipeRemoteDataSource();
    recipeRepoImpl = RecipeRepositoryImpl(mockRecipeRemoteDataSource);
    searchUseCase = SearchUseCase(recipeRepoImpl);
  });

  test(
    'Search for entered food recipe',
    () async {
      const enteredText = 'pizza';
      final List<Meal> expectedResult = [
        Meal(
          idMeal: '1',
          strArea: 'Italian',
          strCategory: 'Pizza',
          strMeal: 'Pizza',
          strMealThumb: 'https://example.com/pizza.jpg',
          strInstructions: 'Cook the pizza',
          ingredients: ['Flour', 'Tomato Sauce', 'Cheese'],
          measures: ['1 cup', '1 cup', '1 cup'],
        )
      ];
      final List<MealEntity> expectedConvertedResult = [
        MealEntity(
          idMeal: '1',
          strArea: 'Italian',
          strCategory: 'Pizza',
          strMeal: 'Pizza',
          strMealThumb: 'https://example.com/pizza.jpg',
          strInstructions: 'Cook the pizza',
          ingredients: ['Flour', 'Tomato Sauce', 'Cheese'],
          measures: ['1 cup', '1 cup', '1 cup'],
        )
      ];

      when(mockRecipeRemoteDataSource.searchMeals(enteredText)).thenAnswer(
        (_) async => expectedResult,
      );

      final result = await searchUseCase.search(enteredText, 'Name');

      verify(mockRecipeRemoteDataSource.searchMeals(enteredText)).called(1);

      expect(result, expectedConvertedResult);
    },
  );
  test(
    'Test Search for food recipe fail',
    () async {
      const enteredText = 'pizza';
      final DioException dioException = DioException(
        requestOptions: RequestOptions(path: enteredText),
        response: Response(
          requestOptions: RequestOptions(path: enteredText),
          statusCode: 404,
          statusMessage: 'Not Found',
        ),
      );

      when(mockRecipeRemoteDataSource.searchMeals(enteredText))
          .thenThrow(Exception("Failed to fetch meals: $dioException"));

      expect(
        () async => await searchUseCase.search(enteredText, 'Name'),
        throwsA(isA<Exception>()),
      );

      verify(mockRecipeRemoteDataSource.searchMeals(enteredText)).called(1);
    },
  );
}
