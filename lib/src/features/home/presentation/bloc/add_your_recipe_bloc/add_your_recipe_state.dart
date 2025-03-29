import 'package:feastly/src/features/ai_chat/data/models/ai_result_model/ai_result_model.dart';
import 'package:feastly/src/features/home/data/models/add_your_recipe_model.dart';

abstract class AddYourRecipeState {}

// image picking states
class InitialState extends AddYourRecipeState {}

class ImageLoading extends AddYourRecipeState {}

class ImagePicked extends AddYourRecipeState {
  final String imagePath;
  ImagePicked({required this.imagePath});
}

class ImageError extends AddYourRecipeState {
  final String message;
  ImageError(this.message);
}

// user store meal
class StoreLoading extends AddYourRecipeState {}

class StoreSuccess extends AddYourRecipeState {}

class StoreError extends AddYourRecipeState {
  final String message;
  StoreError({required this.message});
}

// fetch List of recipes
class RecipeLoading extends AddYourRecipeState {}

class RecipeFetched extends AddYourRecipeState {
  final List<AddYourRecipeModel> recipes; 
  RecipeFetched({required this.recipes});
}

class RecipeEmpty extends AddYourRecipeState {}

class RecipeFetchError extends AddYourRecipeState {
  final String message;
  RecipeFetchError({required this.message});
}

// fetch single recipe by id and return it as an AIResult Model 
class SingleRecipeByIDFetched extends AddYourRecipeState {
  final AiResultModel recipe;
  SingleRecipeByIDFetched({required this.recipe});
}