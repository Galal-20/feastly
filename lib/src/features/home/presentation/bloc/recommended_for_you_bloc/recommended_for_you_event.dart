import '../../../data/models/recommended_for_you_model/recommended_meal_model.dart';

abstract class RecommendedForYouEvent{}

class HomeRecommendedForYouEvent extends RecommendedForYouEvent {}
class MapMealForDetailsEvent  extends RecommendedForYouEvent {
  final RecommendedMeal meal;

  MapMealForDetailsEvent ({required this.meal});
}
