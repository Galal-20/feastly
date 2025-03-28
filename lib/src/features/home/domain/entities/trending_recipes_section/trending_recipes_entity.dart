
import '../../../data/models/trending_recipes_model/trending_meals_response.dart';

class TrendingRecipesEntity {
  final List<TrendingMeal> trendingMeals;

  TrendingRecipesEntity({required this.trendingMeals});

  TrendingRecipesEntity copyWith({List<TrendingMeal>? trendingMeals}) {
    return TrendingRecipesEntity(
      trendingMeals: trendingMeals ?? this.trendingMeals,
    );
  }
}
