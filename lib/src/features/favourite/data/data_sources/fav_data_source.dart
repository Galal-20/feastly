import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:feastly/src/features/ai_chat/data/models/ai_result_model/ai_result_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class FavDataSource {
  final FirebaseFirestore _firestore;
  final FirebaseAuth _auth;
  final FirebaseStorage _storage;

  FavDataSource({
    required FirebaseFirestore firestore,
    required FirebaseAuth auth,
    required FirebaseStorage storage,
  })  : _firestore = firestore,
        _auth = auth,
        _storage = storage;

  Future<void> storeRecipeAsFavFromAi(AiResultModel aiResultModel) async {
    try {
      final user = _auth.currentUser;
      if (user == null) {
        throw Exception('User not authenticated');
      }

      // Upload image to Firebase Storage
      String? imageUrl = await uploadImageFromUrl(
          aiResultModel.imageNetworkUrl, user, _storage);

      // Create a new object with updated image URL
      final updatedRecipe = aiResultModel.copyWith(imageUrl: imageUrl);

      // Convert to JSON and save to Firestore
      final recipeData = updatedRecipe.toJson();
      await _firestore
          .collection('recipes')
          .doc(user.uid)
          .collection('favourites')
          .add(recipeData);
    } catch (e) {
      throw Exception('Failed to store favourite recipe: $e');
    }
  }

Stream<List<AiResultModel>> fetchFavRecipes() {
  final user = _auth.currentUser;
  if (user == null) {
    throw Exception('User not authenticated');
  }

  return _firestore
      .collection('recipes')
      .doc(user.uid)
      .collection('favourites')
      .snapshots()
      .map((querySnapshot) => querySnapshot.docs
          .map((doc) => AiResultModel.fromJson(doc.data()))
          .toList());
}


 Future<void> removeRecipeFromFav(AiResultModel aiResultModel) async {
  try {
    final user = _auth.currentUser;
    if (user == null) {
      throw Exception('User not authenticated');
    }

    final querySnapshot = await _firestore
        .collection('recipes')
        .doc(user.uid)
        .collection('favourites')
        .where('food_title', isEqualTo: aiResultModel.foodTitle)
        .get();

    if (querySnapshot.docs.isEmpty) {
      throw Exception('Recipe not found');
    }

    final docId = querySnapshot.docs.first.id;
    await _firestore
        .collection('recipes')
        .doc(user.uid)
        .collection('favourites')
        .doc(docId)
        .delete();

    if (aiResultModel.imageUrl.isNotEmpty) {
      try {
        final storagePath = Uri.decodeFull(
          aiResultModel.imageUrl.split('?').first.split('/o/').last,
        );

        await _storage.ref(storagePath).delete();
      } catch (e) {
        print('Failed to delete image from storage: $e');
      }
    }
  } catch (e) {
    throw Exception('Failed to remove favourite recipe: $e');
  }
}

}

Future<String?> uploadImageFromUrl(
    String imageUrl, User user, FirebaseStorage storage) async {
  try {
    Dio dio = Dio();

    // Download the image as bytes
    Response<Uint8List> response = await dio.get<Uint8List>(
      imageUrl,
      options: Options(responseType: ResponseType.bytes),
    );

    if (response.statusCode == 200) {
      Uint8List imageBytes = response.data!;

      // Upload to Firebase Storage
      Reference ref = storage.ref().child(
          "'recipes/${user.uid}/${DateTime.now().millisecondsSinceEpoch}.jpg");

      UploadTask uploadTask = ref.putData(imageBytes);
      TaskSnapshot snapshot = await uploadTask;

      // Get the uploaded image URL
      String uploadedimageUrl = await snapshot.ref.getDownloadURL();
      print("Image uploaded successfully: $uploadedimageUrl");

      return uploadedimageUrl;
    } else {
      print("Failed to download image: ${response.statusCode}");
    }
  } catch (e) {
    print("Error uploading image: $e");
  }
  return null;
}


/*
AddYourRecipeModel aiResultModelToAddyourRecipe(AiResultModel aiResultModel) =>
    AddYourRecipeModel(
        ingrediantsNo: aiResultModel.ingredients.length.toString(),
        cookingTime: aiResultModel.cookingTime.toString(),
        summary: aiResultModel.summary,
        protine: aiResultModel.nutritionalInformation.protein,
        carb: aiResultModel.nutritionalInformation.carbs,
        fats: aiResultModel.nutritionalInformation.fats,
        kcal: aiResultModel.nutritionalInformation.kcal,
        vitamins: aiResultModel.nutritionalInformation.vitamins,
        ingredinat1: aiResultModel.ingredients[0].name,
        piece1: aiResultModel.ingredients[0].quantity,
        ingredinat2: aiResultModel.ingredients[1].name,
        piece2: aiResultModel.ingredients[1].quantity,
        ingredinat3: aiResultModel.ingredients[2].name,
        mealImage: aiResultModel.imageNetworkUrl,
        mealType: aiResultModel.ingredients[2].name,
        mealName: aiResultModel.ingredients[3].name,
        piece3: aiResultModel.ingredients[3].quantity,
        ingredinat4: aiResultModel.ingredients[4].name,
        steps: aiResultModel.directions.toString(),
        piece4: aiResultModel.ingredients[04].quantity);
*/