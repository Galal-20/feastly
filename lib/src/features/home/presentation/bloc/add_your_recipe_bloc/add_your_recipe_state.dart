import 'package:feastly/src/features/home/data/models/add_your_recipe_model.dart';

abstract class AddYourRecipeState {}

// image opicking states
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

//user store meal
class StoreLoading extends AddYourRecipeState {}

class StoreSuccess extends AddYourRecipeState {}

class StoreError extends AddYourRecipeState {
  final String message;
  StoreError({required this.message});
}


// fetch recipes
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