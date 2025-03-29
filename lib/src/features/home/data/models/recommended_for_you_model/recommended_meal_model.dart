


import 'dart:convert';

import '../../../../ai_chat/data/models/ai_result_model/ingredient.dart';
import '../../../../ai_chat/data/models/ai_result_model/nutritional_information.dart';
import '../../../domain/entities/recommended_for_you_section/recommended_meal_entity.dart';

class RecommendedMeal extends RecommendedMealEntity {
  RecommendedMeal({
    required super.foodTitle,
    required super.typeOfMeat,
    required super.cookingTime,
    required super.numberOfIngredients,
    required super.servings,
    required super.ratings,
    required super.summary,
    required super.imageUrl,
    required super.nutritionalInfo,
    required super.ingredients,
    required super.directions,
  });

  factory RecommendedMeal.fromJson(Map<String, dynamic> json) {
    print("Raw API Response: ${jsonEncode(json)}");

    return RecommendedMeal(
      foodTitle: json["food_title"] as String,
      typeOfMeat: json["type_of_meat"] as String,
      cookingTime: json['cooking_time'] as String,
      numberOfIngredients: json['number_of_ingredients'] as String,
      servings: json['servings'] as String,
      ratings: json['ratings'] as String,
      summary: json["summary"] as String,
      imageUrl: json["image_url"] as String,
      nutritionalInfo: NutritionalInformation.fromJson(
          json['nutritional_information'] as Map<String, dynamic>),
      ingredients: (json['ingredients'] as List<dynamic>)
          .map((e) => Ingredient.fromJson(e as Map<String, dynamic>))
          .toList(),
      directions: List<dynamic>.from(json["directions"] ?? []),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "food_title": foodTitle,
      "type_of_meat": typeOfMeat,
      "cooking_time": cookingTime,
      "number_of_ingredients": numberOfIngredients,
      "servings": servings,
      "ratings": ratings,
      "summary": summary,
      "image_url": imageUrl,
      'nutritional_information': nutritionalInfo.toJson(),
      'ingredients': ingredients.map((e) => e.toJson()).toList(),
      "directions": directions,
    };
  }

  RecommendedMeal copyWith({
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
    return RecommendedMeal(
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

