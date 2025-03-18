import 'package:feastly/src/features/ai_chat/domain/entities/ai_chat_entity.dart';

import 'ingredient.dart';
import 'nutritional_information.dart';

class AiResultModel extends AiChatEntity {
  String foodTitle;
  String typeOfMeat;
  String cookingTime;
  String servings;
  String summary;
  String imageUrl;
  NutritionalInformation nutritionalInformation;
  List<Ingredient> ingredients;
  List<String> directions;

  AiResultModel({
    required this.foodTitle,
    required this.typeOfMeat,
    required this.cookingTime,
    required this.servings,
    required this.summary,
    required this.imageUrl,
    required this.nutritionalInformation,
    required this.ingredients,
    required this.directions,
  }) : super(
          imageNetworkUrl: imageUrl,
          foodName: foodTitle,
          noOfIngredients: ingredients.length,
          time: cookingTime,
        );

  factory AiResultModel.fromJson(Map<String, dynamic> json) => AiResultModel(
        foodTitle: json['food_title'] as String,
        typeOfMeat: json['type_of_meat'] as String,
        cookingTime: json['cooking_time'] as String,
        servings: json['servings'] as String,
        summary: json['summary'] as String,
        imageUrl: json['image_url'] as String,
        nutritionalInformation: NutritionalInformation.fromJson(
            json['nutritional_information'] as Map<String, dynamic>),
        ingredients: (json['ingredients'] as List<dynamic>)
            .map((e) => Ingredient.fromJson(e as Map<String, dynamic>))
            .toList(),
        directions: json['directions'] as List<String>,
      );

  Map<String, dynamic> toJson() => {
        'food_title': foodTitle,
        'type_of_meat': typeOfMeat,
        'cooking_time': cookingTime,
        'servings': servings,
        'summary': summary,
        'image_url': imageUrl,
        'nutritional_information': nutritionalInformation.toJson(),
        'ingredients': ingredients.map((e) => e.toJson()).toList(),
        'directions': directions,
      };

  AiResultModel copyWith({
    String? foodTitle,
    String? typeOfMeat,
    String? cookingTime,
    String? servings,
    String? summary,
    String? imageUrl,
    NutritionalInformation? nutritionalInformation,
    List<Ingredient>? ingredients,
    List<String>? directions,
  }) {
    return AiResultModel(
      foodTitle: foodTitle ?? this.foodTitle,
      typeOfMeat: typeOfMeat ?? this.typeOfMeat,
      cookingTime: cookingTime ?? this.cookingTime,
      servings: servings ?? this.servings,
      summary: summary ?? this.summary,
      imageUrl: imageUrl ?? this.imageUrl,
      nutritionalInformation:
          nutritionalInformation ?? this.nutritionalInformation,
      ingredients: ingredients ?? this.ingredients,
      directions: directions ?? this.directions,
    );
  }
}
