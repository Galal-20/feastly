import 'dart:convert';
import 'package:feastly/src/features/ai_chat/data/models/ai_result_model/ai_result_model.dart';
import 'package:flutter_gemini/flutter_gemini.dart';

abstract class AiRemoteDataSource {
  Future<AiResultModel> getAiChatResponse(String message);
}

class AiRemoteDataSourceImpl implements AiRemoteDataSource {
  final Gemini gemini;

  AiRemoteDataSourceImpl({required this.gemini});
  @override
  Future<AiResultModel> getAiChatResponse(String message) async {
    String mealAssistantPrompt = '''
You are a meal recommendation assistant. Your task is to provide detailed information about a food item based on the user's input. The user will provide either the name of the food or a list of ingredients. You must respond in JSON format with the following structure:

{
  "food_title": "Name of the food",
  "type_of_meat": "Type of meat used (if applicable, otherwise 'None')",
  "cooking_time": "Total cooking time in minutes",
  "servings": "Number of servings",
  "summary": "A brief description of the food",
  "image_url": "generate the image and give me the URL of this image",
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
}

If the user provides a list of ingredients, suggest a food item that can be made using those ingredients. If the user provides the name of a food, provide the details for that specific food. If the food or ingredients are not recognized, return an error in JSON format:

{
  "error": "Food or ingredients not recognized. Please provide valid input."
}

Now, process the following user input: [$message],and remove comments and don't write anything else.
''';

    var result = await gemini.prompt(
        parts: [Part.text(mealAssistantPrompt)],
        model: 'gemini-2.0-flash-lite-latest');
    return processResponse(result!);
  }

  AiResultModel processResponse(Candidates response) {
    var proccessedResponse =
        response.output!.replaceFirst('json', '').replaceAll('```', '').trim();

    Map<String, dynamic> jsonMap = jsonDecode(proccessedResponse);
    if (jsonMap.containsKey('error')) {
      throw GeminiException(jsonMap['error']);
    }
    return AiResultModel.fromJson(jsonMap);
  }
}
