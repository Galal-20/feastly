
import 'dart:convert';
import 'package:feastly/src/features/home/data/data_sources/trending_recipes_section/trending_recipes_remote_data_source.dart';
import 'package:flutter_gemini/flutter_gemini.dart';

import '../../models/trending_recipes_model/trending_recipes_response_model.dart';

class TrendingRecipesRemoteDataSourceImpl implements TrendingRecipesRemoteDataSource{
  final Gemini gemini;
  TrendingRecipesRemoteDataSourceImpl({required this.gemini});
  @override
  Future<TrendingRecipesResponseModel> getTrendingRecipes() async{
    String mealAssistantPrompt = '''
You are a meal recommendation assistant. Your task is to provide a list of currently trending meal recipes. These should be popular dishes based on global food trends, social media, or widely loved meals. You must respond in JSON format with the following structure:

{
  "trending_meals": [
    {
      "food_title": "Name of the food",
      "type_of_meat": "Type of meat used (if applicable, otherwise 'None')",
      "cooking_time": "Total cooking time in minutes",
      "number_of_ingredients": "Total number of ingredients",
      "servings": "Number of servings",
      "summary": "A brief description of the food",
      "image_url": "Generate the image and provide its URL",
      "nutritional_information": {
        "protein": "Amount of protein in grams",
        "carbs": "Amount of carbohydrates in grams",
        "fats": "Amount of fats in grams",
        "vitamins": "Key vitamins present",
        "kcal": "Total calories"
      },
      "ingredients": [
        {
          "name": "Ingredient name",
          "quantity": "Quantity of the ingredient"
        }
      ],
      "directions": [
        "...",
        "...",
        "..."
      ]
    },
    {
      "food_title": "Another trending meal",
      "type_of_meat": "...",
      "cooking_time": "...",
      "number_of_ingredients": "...",
      "servings": "...",
      "summary": "...",
      "image_url": "...",
      "nutritional_information": {
        "protein": "...",
        "carbs": "...",
        "fats": "...",
        "vitamins": "...",
        "kcal": "..."
      },
      "ingredients": [...],
      "directions": [...]
    }
  ]
}

Provide at least 10 trending meals. Do not base the recommendations on user input—just return globally popular and trending recipes. Ensure that the meals are diverse, including various cuisines and dietary preferences.
All numeric values (e.g., `cooking_time`, `number_of_ingredients`, `servings`, `protein`, `carbs`, `fats`, `kcal`) **MUST be returned as strings** (e.g., `"45"` instead of `45`).
Do not include any explanations or additional text, only return the JSON response.
''';

    var result = await gemini.prompt(
        parts: [Part.text(mealAssistantPrompt)],
        model: 'gemini-2.0-flash-lite-latest');
    return processResponse(result!);
  }

  TrendingRecipesResponseModel processResponse(Candidates response) {
    var processedResponse =
    response.output!.replaceFirst('json', '').replaceAll('```', '').trim();
    Map<String, dynamic> jsonMap = jsonDecode(processedResponse);

    if (jsonMap.containsKey('error')) {
      throw GeminiException(jsonMap['error']);
    }

    return TrendingRecipesResponseModel.fromJson(jsonEncode(jsonMap));
  }

}