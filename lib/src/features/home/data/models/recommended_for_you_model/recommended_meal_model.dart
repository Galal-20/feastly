


import 'dart:convert';
import 'package:feastly/src/features/home/data/models/trending_recipes_model/ingredient_model.dart';
import 'package:feastly/src/features/home/data/models/trending_recipes_model/nutritional_information_model.dart';
import 'package:feastly/src/features/home/domain/entities/trending_recipes_section/trending_meals_entity.dart';

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

  factory RecommendedMeal.fromMap(Map<String, dynamic> map) {
    print("Raw API Response: ${jsonEncode(map)}");

    return RecommendedMeal(
      foodTitle: map["food_title"] as String,
      typeOfMeat: map["type_of_meat"] as String,
      cookingTime: map['cooking_time'] as String,
      numberOfIngredients: map['number_of_ingredients'] as String,
      servings: map['servings'] as String,
      ratings: map['ratings'] as String,
      summary: map["summary"] as String,
      imageUrl: map["image_url"] as String,
      nutritionalInfo: NutritionalInformation.fromMap(map["nutritional_information"] ?? {}),
      ingredients: List<Ingredient>.from(
          map["ingredients"]?.map((x) => Ingredient.fromMap(x)) ?? []),
      directions: List<dynamic>.from(map["directions"] ?? []),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "food_title": foodTitle,
      "type_of_meat": typeOfMeat,
      "cooking_time": cookingTime,
      "number_of_ingredients": numberOfIngredients,
      "servings": servings,
      "ratings": ratings,
      "summary": summary,
      "image_url": imageUrl,
      "nutritional_information": nutritionalInfo.toMap(),
      "ingredients": ingredients.map((x) => x.toMap()).toList(),
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

