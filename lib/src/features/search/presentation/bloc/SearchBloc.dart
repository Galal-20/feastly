import 'package:dio/dio.dart';
import 'package:feastly/src/features/ai_chat/data/models/ai_result_model/ai_result_model.dart';
import 'package:feastly/src/features/ai_chat/data/models/ai_result_model/ingredient.dart';
import 'package:feastly/src/features/ai_chat/data/models/ai_result_model/nutritional_information.dart';
import 'package:feastly/src/features/foodDetails/domain/entities/meal_entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecases/uaseCase.dart';
import 'SearchEvent.dart';
import 'SearchState.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final SearchUseCase searchUseCase;

  SearchBloc(this.searchUseCase) : super(SearchInitial()) {
    on<SearchQueryChanged>(_onSearchQueryChanged);
  }

  Future<void> _onSearchQueryChanged(
      SearchQueryChanged event, Emitter<SearchState> emit) async {
    emit(SearchLoading());

    try {
      final recipes = await searchUseCase.search(event.query, event.filter);

      if (recipes.isNotEmpty) {
        emit(SearchSuccess(recipes));
      } else {
        emit(SearchError("No results found for '${event.query}'"));
      }
    } on DioException catch (e) {
      emit(SearchError("Network error: ${e.message}"));
    } catch (e) {
      emit(SearchError("Unexpected error occurred. Please try again."));
    }
  }

  AiResultModel mealEntityToAiResultModel(MealEntity mealEntity) {

    return AiResultModel(
      ingredients: mealEntityToIngredients(mealEntity),
      foodTitle: mealEntity.strMeal,
      typeOfMeat: mealEntity.strCategory ?? "",
      cookingTime: 15,
      servings: 1,
      summary: mealEntity.strInstructions ?? '',
      imageUrl: mealEntity.strMealThumb ?? ' ',
      directions: mealEntity.strInstructions?.split(RegExp(r'\.\s+|\n')) ?? [],
      nutritionalInformation: NutritionalInformation(
          protein: '50',
          carbs: '20',
          fats: '10',
          vitamins: 'B',
          kcal: '200'),
    );
  }
  List<Ingredient> mealEntityToIngredients(MealEntity mealEntity) {
    List<Ingredient> ingredients = [];
    for (int i = 0; i < mealEntity.ingredients.length; i++) {
      ingredients.add(Ingredient(
          name: mealEntity.ingredients[i],
          quantity: mealEntity.measures[i]));
    }
    return ingredients;
  }


  
}
