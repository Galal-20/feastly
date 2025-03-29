
import 'dart:convert';
import 'package:feastly/src/features/home/data/data_sources/recommended_for_you_section/recommended_for_you_remote_data_source.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import '../../models/recommended_for_you_model/recommended_for_you_model.dart';

class RecommendedForYouRemoteDataSourceImpl implements RecommendedForYouRemoteDataSource{
  final Gemini gemini;
  RecommendedForYouRemoteDataSourceImpl({required this.gemini});
  @override
  Future<RecommendedForYouModel> getRecommendedMeals() async{
    String mealAssistantPrompt = '''
You are a meal recommendation assistant. Your task is to provide a list of  meal recipes you recommend for me. These should be popular dishes based on global food trends, social media, or widely loved meals. You must respond in JSON format with the following structure:

{
  "recommended_meals": [
    {
      "food_title": "Name of the food",
      "type_of_meat": "Type of meat used (if applicable, otherwise 'None')",
      "cooking_time": "Total cooking time in minutes",
      "number_of_ingredients": "Total number of ingredients",
      "servings": "Number of servings",
      "ratings": "Number of ratings",
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
      "food_title": "Another recommended meal",
      "type_of_meat": "...",
      "cooking_time": "...",
      "number_of_ingredients": "...",
      "servings": "...",
      "ratings": "Number of ratings",
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
All numeric values (e.g., `cooking_time`, `number_of_ingredients`, `servings`,`ratings` ,`protein`, `carbs`, `fats`, `kcal`) **MUST be returned as strings** (e.g., `"45"` instead of `45`).
Do not include any explanations or additional text, only return the JSON response.
''';

    var result = await gemini.prompt(
        parts: [Part.text(mealAssistantPrompt)],
        model: 'gemini-2.0-flash-lite-latest');
    return processResponse(result!);
  }

  RecommendedForYouModel processResponse(Candidates response) {
    var processedResponse =
    response.output!.replaceFirst('json', '').replaceAll('```', '').trim();
    Map<String, dynamic> jsonMap = jsonDecode(processedResponse);

    if (jsonMap.containsKey('error')) {
      throw GeminiException(jsonMap['error']);
    }
    print('this is from theeeeeeeeeeeee');
    print(processedResponse);

    return RecommendedForYouModel.fromJson(jsonEncode(jsonMap));
  }

}