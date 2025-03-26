

import 'package:feastly/src/features/home/data/models/trending_recipes_model/ingredient_model.dart';
import 'package:feastly/src/features/home/data/models/trending_recipes_model/nutritional_information_model.dart';

class RecommendedMealEntity {
  final String foodTitle;
  final String typeOfMeat;
  final String cookingTime;
  final String numberOfIngredients;
  final String servings;
  final String ratings;
  final String summary;
   String imageUrl;
  final NutritionalInformation nutritionalInfo;
  final List<Ingredient> ingredients;
  final List<dynamic> directions;

  RecommendedMealEntity({
    required this.foodTitle,
    required this.typeOfMeat,
    required this.cookingTime,
    required this.numberOfIngredients,
    required this.servings,
    required this.ratings,
    required this.summary,
    required this.imageUrl,
    required this.nutritionalInfo,
    required this.ingredients,
    required this.directions,
  });

  RecommendedMealEntity copyWith({
    String? foodTitle,
    String? typeOfMeat,
    String? cookingTime,
    String? numberOfIngredients,
    String? servings,
    String? ratings,
    String? summary,
    String? imageUrl,
    NutritionalInformation? nutritionalInfo,
    List<Ingredient>? ingredients,
    List<dynamic>? directions,
  }) {
    return RecommendedMealEntity(
      foodTitle: foodTitle ?? this.foodTitle,
      typeOfMeat: typeOfMeat ?? this.typeOfMeat,
      cookingTime: cookingTime ?? this.cookingTime,
      numberOfIngredients: numberOfIngredients ?? this.numberOfIngredients,
      servings: servings ?? this.servings,
      ratings: ratings ?? this.ratings,
      summary: summary ?? this.summary,
      imageUrl: imageUrl ?? this.imageUrl,
      nutritionalInfo: nutritionalInfo ?? this.nutritionalInfo,
      ingredients: ingredients ?? this.ingredients,
      directions: directions ?? this.directions,
    );
  }


}
