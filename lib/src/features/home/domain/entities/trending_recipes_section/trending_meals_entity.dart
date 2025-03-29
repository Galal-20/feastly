
import '../../../../ai_chat/data/models/ai_result_model/ingredient.dart';
import '../../../../ai_chat/data/models/ai_result_model/nutritional_information.dart';

class TrendingMealEntity {
  final String foodTitle;
  final String typeOfMeat;
  final String cookingTime;
  final String numberOfIngredients;
  final String servings;
  final String summary;
   String imageUrl;
  final NutritionalInformation nutritionalInfo;
  final List<Ingredient> ingredients;
  final List<dynamic> directions;

  TrendingMealEntity({
    required this.foodTitle,
    required this.typeOfMeat,
    required this.cookingTime,
    required this.numberOfIngredients,
    required this.servings,
    required this.summary,
    required this.imageUrl,
    required this.nutritionalInfo,
    required this.ingredients,
    required this.directions,
  });

  TrendingMealEntity copyWith({
    String? foodTitle,
    String? typeOfMeat,
    String? cookingTime,
    String? numberOfIngredients,
    String? servings,
    String? summary,
    String? imageUrl,
    NutritionalInformation? nutritionalInfo,
    List<Ingredient>? ingredients,
    List<dynamic>? directions,
  }) {
    return TrendingMealEntity(
      foodTitle: foodTitle ?? this.foodTitle,
      typeOfMeat: typeOfMeat ?? this.typeOfMeat,
      cookingTime: cookingTime ?? this.cookingTime,
      numberOfIngredients: numberOfIngredients ?? this.numberOfIngredients,
      servings: servings ?? this.servings,
      summary: summary ?? this.summary,
      imageUrl: imageUrl ?? this.imageUrl,
      nutritionalInfo: nutritionalInfo ?? this.nutritionalInfo,
      ingredients: ingredients ?? this.ingredients,
      directions: directions ?? this.directions,
    );
  }


}
