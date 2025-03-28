// Bloc States
import 'package:feastly/src/features/ai_chat/data/models/ai_result_model/ai_result_model.dart';

abstract class MealDetailsState {}

class MealDetailsInitial extends MealDetailsState {}
class MealDetailsLoading extends MealDetailsState {}
class MealDetailsLoaded extends MealDetailsState {
  final AiResultModel meal;
  MealDetailsLoaded({required this.meal});
}
class MealDetailsError extends MealDetailsState {
  final String message;
  MealDetailsError({required this.message});
}
class FavoriteMealRecipeAdded extends MealDetailsState {}
class FavoriteMealRecipeRemoved extends MealDetailsState {}
class FavoriteError extends MealDetailsState {
  final String message;
  FavoriteError(this.message);
}
class FavIconToggled extends MealDetailsState {}
