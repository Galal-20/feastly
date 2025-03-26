


import 'dart:convert';
import 'package:feastly/src/features/home/data/models/trending_recipes_model/ingredient_model.dart';
import 'package:feastly/src/features/home/data/models/trending_recipes_model/nutritional_information_model.dart';
import 'package:feastly/src/features/home/domain/entities/trending_recipes_section/trending_meals_entity.dart';

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

  factory TrendingMeal.fromMap(Map<String, dynamic> map) {
    print("Raw API Response: ${jsonEncode(map)}");

    return TrendingMeal(
      foodTitle: map["food_title"] as String,
      typeOfMeat: map["type_of_meat"] as String,
      cookingTime: map['cooking_time'] as String,
      numberOfIngredients: map['number_of_ingredients'] as String,
      servings: map['servings'] as String,
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
      "summary": summary,
      "image_url": imageUrl,
      "nutritional_information": nutritionalInfo.toMap(),
      "ingredients": ingredients.map((x) => x.toMap()).toList(),
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

