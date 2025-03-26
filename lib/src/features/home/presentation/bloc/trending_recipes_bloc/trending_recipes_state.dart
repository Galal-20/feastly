import 'package:feastly/src/features/home/domain/entities/trending_recipes_section/trending_recipes_entity.dart';

abstract class TrendingRecipesState {}

class TrendingRecipesInitial extends TrendingRecipesState {}

class TrendingRecipesLoading extends TrendingRecipesState {}

class TrendingRecipesSuccess extends TrendingRecipesState {
  final TrendingRecipesEntity trendingRecipesEntity;
  TrendingRecipesSuccess({required this.trendingRecipesEntity});
}

class TrendingRecipesError extends TrendingRecipesState {
  final String message;
  TrendingRecipesError({required this.message});
}
