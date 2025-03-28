
import 'package:feastly/src/features/home/data/models/trending_recipes_model/trending_meals_response.dart';

import '../../../ai_chat/data/models/ai_result_model/ai_result_model.dart';
import '../../data/models/recommended_for_you_model/recommended_meal_model.dart';

class MealsMapper {
  static AiResultModel mapRecommendedMeal(RecommendedMeal meal) {
    return AiResultModel(
   cookingTime: int.tryParse(meal.cookingTime) ?? 0,
      foodTitle: meal.foodTitle,
      typeOfMeat: meal.typeOfMeat,
      summary: meal.summary,
      servings: int.tryParse(meal.servings) ?? 0,
      imageUrl: meal.imageUrl,
      directions: meal.directions,
      ingredients: meal.ingredients,
      nutritionalInformation: meal.nutritionalInfo
    );
  }

  static AiResultModel mapTrendingMeal(TrendingMeal meal) {
    return AiResultModel(
        cookingTime: int.tryParse(meal.cookingTime) ?? 0,
        foodTitle: meal.foodTitle,
        typeOfMeat: meal.typeOfMeat,
        summary: meal.summary,
        servings: int.tryParse(meal.servings) ?? 0,
        imageUrl: meal.imageUrl,
        directions: meal.directions,
        ingredients: meal.ingredients,
        nutritionalInformation: meal.nutritionalInfo
    );
  }

}
