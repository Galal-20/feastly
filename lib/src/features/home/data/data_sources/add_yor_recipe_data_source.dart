import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:feastly/src/features/ai_chat/data/models/ai_result_model/ingredient.dart';
import 'package:feastly/src/features/ai_chat/data/models/ai_result_model/nutritional_information.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:feastly/src/features/ai_chat/data/models/ai_result_model/ai_result_model.dart';
import 'package:feastly/src/features/home/data/models/add_your_recipe_model.dart';
import 'package:flutter/foundation.dart';

abstract class AddYourRecipeDataSourceAbstract {
  Future<void> storeUserRecipe({required AddYourRecipeModel addYourRecipeModel});
  Future<AiResultModel> getMealbyID({required String mealID});
}

class AddYourRecipeDataSourceImpl implements AddYourRecipeDataSourceAbstract {
  final FirebaseFirestore _firestore;
  final FirebaseAuth _auth;
  final FirebaseStorage _storage;

  AddYourRecipeDataSourceImpl({
    required FirebaseFirestore firestore,
    required FirebaseAuth auth,
    required FirebaseStorage storage,
  })  : _firestore = firestore,
        _auth = auth,
        _storage = storage;

  @override
  Future<void> storeUserRecipe({required AddYourRecipeModel addYourRecipeModel}) async {
    try {
      String? uid = _auth.currentUser?.uid;
      if (uid == null) {
        throw Exception('No user logged in');
      }

      String imageUrl = '';
      if (addYourRecipeModel.mealImage is File) {
        try {
          String fileName = 'recipe_$uid${DateTime.now().millisecondsSinceEpoch}.jpg';
          debugPrint("file nammmmmme is $fileName");
          Reference storageRef = _storage.ref().child('recipes/$uid/$fileName');
          debugPrint("store reffff is $storageRef");
          TaskSnapshot uploadTask = await storageRef.putFile(addYourRecipeModel.mealImage as File);
          debugPrint("uplllooooddd taskkk is $uploadTask");
          TaskSnapshot snapshot = await uploadTask;
          debugPrint("snapppppshottt taskkk is $snapshot");

          imageUrl = await snapshot.ref.getDownloadURL();
          debugPrint('Image uploaded successfully: $imageUrl');
        } catch (e) {
          debugPrint('Failed to upload image: $e');
          imageUrl = '';
        }
      }

      Map<String, dynamic> recipeData = addYourRecipeModel.toMap(imageUrl: imageUrl);
      debugPrint("recipe for userrrr is $recipeData");

      await _firestore
          .collection('recipes')
          .doc(uid)
          .collection('userRecipes')
          .add(recipeData);

      debugPrint("dataaaa now in firestore as a new recipe");
      debugPrint('Recipe stored successfully with UID: $uid and image URL: $imageUrl!');
    } catch (e) {
      debugPrint('Error storing recipe: $e');
      throw Exception('Failed to store recipe: $e');
    }
  }

  @override
  Future<AiResultModel> getMealbyID({required String mealID}) async {
    try {
      String? uid = _auth.currentUser?.uid;
      final doc = await _firestore
          .collection('recipes')
          .doc(uid)
          .collection('userRecipes')
          .doc(mealID)
          .get();
      debugPrint("Doccccccc get are $doc");
      if (!doc.exists) {
        throw Exception('Recipe not found with ID: $mealID');
      }

      final data =await doc.data()!;
      debugPrint("doccccccccc daaaattttaaa are $data");

      final List<Ingredient> ingredientsList =await [
        if (data['ingredinat1']?.isNotEmpty ?? false)
          Ingredient(name: data['ingredinat1'] ?? '', quantity: data['piece1'] ?? ''),
        if (data['ingredinat2']?.isNotEmpty ?? false)
          Ingredient(name: data['ingredinat2'] ?? '', quantity: data['piece2'] ?? ''),
        if (data['ingredinat3']?.isNotEmpty ?? false)
          Ingredient(name: data['ingredinat3'] ?? '', quantity: data['piece3'] ?? ''),
        if (data['ingredinat4']?.isNotEmpty ?? false)
          Ingredient(name: data['ingredinat4'] ?? '', quantity: data['piece4'] ?? ''),
      ];

      debugPrint("inngerreeediantts aree $ingredientsList");
      final List<dynamic> directions = data['steps']?.isNotEmpty ?? false
          ? (data['steps'] as String).split('\n').where((step) => step.trim().isNotEmpty).toList()
          : [];
      debugPrint("diecrionss stepppps are $directions");

      return AiResultModel(
        foodTitle: data['mealName'] ?? '',
        typeOfMeat: data['mealType'] ?? '',
        cookingTime: int.tryParse(data['cookingTime'] ?? '') ?? 0,
        servings: 1,
        summary: data['summary'] ?? '',
        imageUrl: data['mealImage'] ?? '',
        nutritionalInformation: NutritionalInformation(
          protein: data['protine'] ?? '',
          carbs: data['carb'] ?? '',
          fats: data['fats'] ?? '',
          vitamins: data['vitamins'] ?? '',
          kcal: data['kcal'] ?? '',
        ),
        ingredients: ingredientsList,
        directions: directions,
      );
    } catch (e) {
      debugPrint("Errrrrrrrrrrrrrrrrrrrrrorrrrrrrr");
      debugPrint('Error fetching recipe in dataaa sourccce: $e');
      throw Exception('Failed to fetch recipe: $e');
    }
  }
}