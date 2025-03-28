import 'dart:developer';

import 'package:feastly/src/features/home/domain/usecases/trending_recipes_section/get_trending_recipes_usecase.dart';
import 'package:feastly/src/features/home/presentation/bloc/trending_recipes_bloc/trending_recipes_event.dart';
import 'package:feastly/src/features/home/presentation/bloc/trending_recipes_bloc/trending_recipes_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../ai_chat/domain/use_case/get_image_use_case.dart';
import '../../mapper/model_mapper.dart';

class TrendingRecipesBloc
    extends Bloc<TrendingRecipesEvent, TrendingRecipesState> {
  final GetTrendingRecipesUseCase getTrendingRecipesUseCase;
  final GetImageUseCase getImageUseCase;

  TrendingRecipesBloc(this.getTrendingRecipesUseCase, this.getImageUseCase)
      : super(TrendingRecipesInitial()) {
    on<HomeTrendingRecipesEvent>(_getTrendingRecipes);
    on<MapMealForDetailsEvent>(_mapMealForDetails);
  }

  Future<void> _getTrendingRecipes(HomeTrendingRecipesEvent event,
      Emitter<TrendingRecipesState> emit) async {
    if (event.isLoaded) {
      emit(TrendingRecipesSuccess(trendingRecipesEntity: null));
    } else {
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
    }
  }

  void _mapMealForDetails(
      MapMealForDetailsEvent event, Emitter<TrendingRecipesState> emit) {
    final mappedMeal = MealsMapper.mapTrendingMeal(event.meal);
    emit(TrendingRecipesMapped(mappedMeal: mappedMeal));
  }
}
