import 'package:feastly/src/features/home/domain/entities/trending_recipes_section/trending_recipes_entity.dart';

import '../../../../ai_chat/data/models/ai_result_model/ai_result_model.dart';

abstract class TrendingRecipesState {}

class TrendingRecipesInitial extends TrendingRecipesState {}

class TrendingRecipesLoading extends TrendingRecipesState {}

class TrendingRecipesSuccess extends TrendingRecipesState {
  TrendingRecipesEntity? trendingRecipesEntity;
  TrendingRecipesSuccess({required this.trendingRecipesEntity});
}

class TrendingRecipesMapped extends TrendingRecipesState {
  final AiResultModel mappedMeal;

  TrendingRecipesMapped({required this.mappedMeal});
}

class TrendingRecipesError extends TrendingRecipesState {
  final String message;
  TrendingRecipesError({required this.message});
}
