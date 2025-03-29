import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:feastly/src/features/home/data/models/add_your_recipe_model.dart';
import 'package:feastly/src/features/home/domain/usecases/add_your_recipe_usecase.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'add_your_recipe_event.dart';
import 'add_your_recipe_state.dart';

class AddYourRecipeBloc extends Bloc<AddYourRecipeEvent, AddYourRecipeState> {
  final AddYourRecipeUsecase storeUserRecipeUseCase;
  String? _imagePath;

  AddYourRecipeBloc({required this.storeUserRecipeUseCase})
      : super(InitialState()) {
    on<PickImageEvent>((event, emit) async {
      emit(ImageLoading());
      try {
        final picker = ImagePicker();
        final pickedFile = await picker.pickImage(source: ImageSource.gallery);

        if (pickedFile != null) {
          _imagePath = pickedFile.path;
          emit(ImagePicked(imagePath: _imagePath!));
          debugPrint("image pickkkkedddddd");
        } else {
          emit(InitialState());
        }
      } catch (e) {
        emit(ImageError('Failed to pick image: $e'));
      }
    });

    on<StoreRecipeEvent>((event, emit) async {
      emit(StoreLoading());
      try {
        await storeUserRecipeUseCase.storeUserRecipe(
            addYourRecipeEnitiy: event.recipe);
        debugPrint("storrredddd");
        emit(StoreSuccess());
        add(FetchRecipeEvent());
      } catch (e) {
        debugPrint("error in bloc");
        debugPrint(e.toString());
        emit(StoreError(message: 'Failed to store recipe: $e'));
      }
    });

    on<FetchRecipeEvent>((event, emit) async {
      emit(RecipeLoading());
      try {
        final user = FirebaseAuth.instance.currentUser;
        if (user == null) {
          emit(RecipeFetchError(message: 'User not authenticated'));
          return;
        }

        final querySnapshot = await FirebaseFirestore.instance
            .collection('recipes')
            .doc(user.uid)
            .collection('userRecipes')
            .get();

        if (querySnapshot.docs.isEmpty) {
          emit(RecipeEmpty());
          return;
        }

        final recipes = querySnapshot.docs.map((doc) {
          final recipeData = doc.data();
          return AddYourRecipeModel(
            mealImage: recipeData['mealImage'],
            mealType: recipeData['mealType'],
            mealName: recipeData['mealName'],
            ingrediantsNo: recipeData['ingrediantsNo'],
            cookingTime: recipeData['cookingTime'],
            summary: recipeData['summary'],
            protine: recipeData['protine'],
            carb: recipeData['carb'],
            fats: recipeData['fats'],
            kcal: recipeData['kcal'],
            vitamins: recipeData['vitamins'],
            ingredinat1: recipeData['ingredinat1'],
            piece1: recipeData['piece1'],
            ingredinat2: recipeData['ingredinat2'],
            piece2: recipeData['piece2'],
            ingredinat3: recipeData['ingredinat3'],
            piece3: recipeData['piece3'],
            ingredinat4: recipeData['ingredinat4'],
            piece4: recipeData['piece4'],
            steps: recipeData['steps'],
            docID: doc.id,
          );
        }).toList();

        emit(RecipeFetched(recipes: recipes));
      } catch (e) {
        emit(RecipeFetchError(message: 'Failed to fetch recipes: $e'));
      }
    });

    on<FetchSingleRecipeByIDEvent>((event, emit) async {
      emit(RecipeLoading());
      try {
        final recipe =
            await storeUserRecipeUseCase.getMealById(mealID: event.mealID);
        debugPrint("recccipeeeee in Bolc is $recipe");
        emit(SingleRecipeByIDFetched(recipe: recipe));
      } catch (e) {
        debugPrint('Error fetching single recipe inBolccc: $e');
        emit(RecipeFetchError(message: 'Failed to fetch recipe in Bloooc: $e'));
      }
    });
  }

  String? get imagePath => _imagePath;
}
