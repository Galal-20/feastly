import 'dart:developer';

import 'package:feastly/src/features/home/domain/usecases/trending_recipes_section/get_trending_recipes_usecase.dart';
import 'package:feastly/src/features/home/presentation/bloc/trending_recipes_bloc/trending_recipes_event.dart';
import 'package:feastly/src/features/home/presentation/bloc/trending_recipes_bloc/trending_recipes_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../ai_chat/domain/use_case/get_image_use_case.dart';

class TrendingRecipesBloc
    extends Bloc<TrendingRecipesEvent, TrendingRecipesState> {
  final GetTrendingRecipesUseCase getTrendingRecipesUseCase;
  final GetImageUseCase getImageUseCase;

  TrendingRecipesBloc(this.getTrendingRecipesUseCase,this.getImageUseCase)
      : super(TrendingRecipesInitial()) {
    on<HomeTrendingRecipesEvent>(_getTrendingRecipes);
  }
  // Future<void> _getTrendingRecipes(HomeTrendingRecipesEvent event,
  //     Emitter<TrendingRecipesState> emit) async {
  //   emit(TrendingRecipesLoading());
  //   var result = await getTrendingRecipesUseCase.call();
  //   await result.fold(
  //     (error) {
  //       log(error.message);
  //       emit(TrendingRecipesError(message: error.message));
  //     },
  //     (response) async {
  //       // response.trendingMeals.forEach((meal) {
  //       //   log("Meal: ${meal.foodTitle}, Cooking Time: ${meal.cookingTime}, Ingredients: ${meal.numberOfIngredients}");
  //       // });
  //       // for (var response in response.trendingMeals) {
  //       //   response.imageUrl = await getImageUrl(response.foodTitle);
  //       //   log('image = ${response.imageUrl}');
  //       //   log("🍽️ Meal: ${response.foodTitle}, Image: ${response.imageUrl}");
  //       // }
  //       // List<TrendingMeal> updatedMeals = [];
  //       //
  //       // for (var meal in response.trendingMeals) {
  //       //   String imageUrl = await getImageUrl(meal.foodTitle);
  //       //   log("🍽️ Meal: ${meal.foodTitle}, Image: $imageUrl");
  //       //   updatedMeals.add(meal.copyWith(imageUrl: imageUrl));
  //       // }
  //       //
  //       // final updatedResponse = response.copyWith(trendingMeals: updatedMeals);
  //       emit(TrendingRecipesSuccess(trendingRecipesEntity: updatedResponse));
  //     },
  //   );
  // }

  Future<void> _getTrendingRecipes(
      HomeTrendingRecipesEvent event, Emitter<TrendingRecipesState> emit) async {
    emit(TrendingRecipesLoading());

    final result = await getTrendingRecipesUseCase.call();
    result.fold(
          (error) {
        log(error.message);
        emit(TrendingRecipesError(message: error.message));
      },
          (response) {
        emit(TrendingRecipesSuccess(trendingRecipesEntity: response));
      },
    );


}}
