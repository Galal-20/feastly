// Bloc States
import 'package:feastly/src/features/searchedMealDetails/domain/entities/meal_entity.dart';

abstract class SearchedMealDetailsState {}

class SearchedMealDetailsInitial extends SearchedMealDetailsState {}
class SearchedMealDetailsLoading extends SearchedMealDetailsState {}
class SearchedMealDetailsLoaded extends SearchedMealDetailsState {
  final MealEntity meal;
  SearchedMealDetailsLoaded({required this.meal});
}
class SearchedMealDetailsError extends SearchedMealDetailsState {
  final String message;
  SearchedMealDetailsError({required this.message});
}
