import 'package:feastly/src/features/home/data/models/trending_recipes_model/trending_meals_response.dart';

abstract class TrendingRecipesEvent {}

class HomeTrendingRecipesEvent extends TrendingRecipesEvent {}

class MapMealForDetailsEvent  extends TrendingRecipesEvent {
  final TrendingMeal meal;

  MapMealForDetailsEvent({required this.meal});
}