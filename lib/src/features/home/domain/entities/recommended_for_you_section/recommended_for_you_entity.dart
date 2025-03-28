
import 'package:feastly/src/features/home/data/models/recommended_for_you_model/recommended_meal_model.dart';


class RecommendedForYouEntity {
  final List<RecommendedMeal> recommendedMeals;

  RecommendedForYouEntity({required this.recommendedMeals});

  RecommendedForYouEntity copyWith({List<RecommendedMeal>? recommendedMeals}) {
    return RecommendedForYouEntity(
      recommendedMeals: recommendedMeals ?? this.recommendedMeals,
    );
  }
}
