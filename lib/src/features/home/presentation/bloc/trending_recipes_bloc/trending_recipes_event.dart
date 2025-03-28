import 'package:feastly/src/features/home/data/models/trending_recipes_model/trending_meals_response.dart';

abstract class TrendingRecipesEvent {}

class HomeTrendingRecipesEvent extends TrendingRecipesEvent {
  bool isLoaded;
  HomeTrendingRecipesEvent({this.isLoaded = false});
}

class MapMealForDetailsEvent extends TrendingRecipesEvent {
  final TrendingMeal meal;

  MapMealForDetailsEvent({required this.meal});
}
