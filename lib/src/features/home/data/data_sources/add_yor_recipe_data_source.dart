import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:feastly/src/features/home/data/models/add_your_recipe_model.dart';
import 'package:flutter/foundation.dart';

abstract class AddYourRecipeDataSourceAbstract {
  Future<void> storeUserRecipe(
      {required AddYourRecipeModel addYourRecipeModel});
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
  Future<void> storeUserRecipe(
      {required AddYourRecipeModel addYourRecipeModel}) async {
    try {
      String? uid = _auth.currentUser?.uid;
      if (uid == null) {
        throw Exception('No user logged in');
      }

      // Store image in Firebase Storage
      String imageUrl = '';
      if (addYourRecipeModel.mealImage is File) {
        try {
          String fileName =
              'recipe_$uid${DateTime.now().millisecondsSinceEpoch}.jpg';
          debugPrint("file nammmmmme is $fileName");
          Reference storageRef = _storage.ref().child('recipes/$uid/$fileName');
          debugPrint("store reffff is $storageRef");
          TaskSnapshot uploadTask =
              await storageRef.putFile(addYourRecipeModel.mealImage as File);
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

      // Store recipe in subcollection 'userRecipes' under user's UID
      Map<String, dynamic> recipeData =
          addYourRecipeModel.toMap(imageUrl: imageUrl);
      debugPrint("recipe for userrrr is $recipeData");
      
      await _firestore
          .collection('recipes')
          .doc(uid)
          .collection('userRecipes')
          .add(recipeData);
      
      debugPrint("dataaaa now in firestore as a new recipe");
      debugPrint(
          'Recipe stored successfully with UID: $uid and image URL: $imageUrl!');
    } catch (e) {
      debugPrint('Error storing recipe: $e');
      throw Exception('Failed to store recipe: $e');
    }
  }
}
