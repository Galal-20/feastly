import 'package:feastly/src/features/home/data/models/add_your_recipe_model.dart';

abstract class AddYourRecipeEvent {}

class PickImageEvent extends AddYourRecipeEvent {
  PickImageEvent();
}

class StoreRecipeEvent extends AddYourRecipeEvent {
  final AddYourRecipeModel recipe; 
  StoreRecipeEvent(this.recipe);
}

class FetchRecipeEvent extends AddYourRecipeEvent {}

class FetchSingleRecipeByIDEvent extends AddYourRecipeEvent {
  final String mealID;
  FetchSingleRecipeByIDEvent({required this.mealID});
}

class DeleteRecipeEvent extends AddYourRecipeEvent {
  final String mealID;
  DeleteRecipeEvent({required this.mealID});
}