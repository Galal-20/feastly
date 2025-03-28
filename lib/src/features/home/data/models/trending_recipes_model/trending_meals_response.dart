


import 'dart:convert';
import 'package:feastly/src/features/home/domain/entities/trending_recipes_section/trending_meals_entity.dart';

import '../../../../ai_chat/data/models/ai_result_model/ingredient.dart';
import '../../../../ai_chat/data/models/ai_result_model/nutritional_information.dart';

class TrendingMeal extends TrendingMealEntity {
  TrendingMeal({
    required super.foodTitle,
    required super.typeOfMeat,
    required super.cookingTime,
    required super.numberOfIngredients,
    required super.servings,
    required super.summary,
    required super.imageUrl,
    required super.nutritionalInfo,
    required super.ingredients,
    required super.directions,
  });

  factory TrendingMeal.fromJson(Map<String, dynamic> json) {
    print("Raw API Response: ${jsonEncode(json)}");

    return TrendingMeal(
      foodTitle: json["food_title"] as String,
      typeOfMeat: json["type_of_meat"] as String,
      cookingTime: json['cooking_time'] as String,
      numberOfIngredients: json['number_of_ingredients'] as String,
      servings: json['servings'] as String,
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
      "summary": summary,
      "image_url": imageUrl,
      'nutritional_information': nutritionalInfo.toJson(),
      'ingredients': ingredients.map((e) => e.toJson()).toList(),
      "directions": directions,
    };
  }

  TrendingMeal copyWith({
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
    return TrendingMeal(
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

