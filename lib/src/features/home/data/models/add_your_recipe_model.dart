import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:feastly/src/features/home/domain/entities/add_your_recipe_entity.dart';

class AddYourRecipeModel extends AddYourRecipeEntity {
  AddYourRecipeModel({
    required super.mealImage,
    required super.mealType,
    required super.mealName,
    required super.ingrediantsNo,
    required super.cookingTime,
    required super.summary,
    required super.protine,
    required super.carb,
    required super.fats,
    required super.kcal,
    required super.vitamins,
    required super.ingredinat1,
    required super.piece1,
    required super.ingredinat2,
    required super.piece2,
    required super.ingredinat3,
    required super.piece3,
    required super.ingredinat4,
    required super.piece4,
    required super.step1,
    required super.step2,
  });

  Map<String, dynamic> toMap({required String imageUrl}) {
    return {
      'mealImage': imageUrl, 
      'mealType': mealType,
      'mealName': mealName,
      'ingrediantsNo': ingrediantsNo,
      'cookingTime': cookingTime,
      'summary': summary,
      'protine': protine,
      'carb': carb,
      'fats': fats,
      'kcal': kcal,
      'vitamins': vitamins,
      'ingredinat1': ingredinat1,
      'piece1': piece1,
      'ingredinat2': ingredinat2,
      'piece2': piece2,
      'ingredinat3': ingredinat3,
      'piece3': piece3,
      'ingredinat4': ingredinat4,
      'piece4': piece4,
      'step1': step1,
      'step2': step2,
      'timestamp': FieldValue.serverTimestamp(),
    };
  }
}
