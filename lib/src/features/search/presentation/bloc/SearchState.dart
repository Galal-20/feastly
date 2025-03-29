// import '../../../mealDetails/data/models/meal.dart';
//
// abstract class SearchState {}
//
// class SearchInitial extends SearchState {}
//
// class SearchLoading extends SearchState {}
//
// class SearchSuccess extends SearchState {
//   final List<Meal> meals;
//
//   SearchSuccess(this.meals);
// }
//
// class SearchError extends SearchState {
//   final String message;
//
//   SearchError(this.message);
// }

import 'package:feastly/src/features/foodDetails/domain/entities/meal_entity.dart';

abstract class SearchState {}

class SearchInitial extends SearchState {}

class SearchLoading extends SearchState {}

class SearchSuccess extends SearchState {
  final List<MealEntity> recipes;

  SearchSuccess(this.recipes);
}

class SearchError extends SearchState {
  final String message;

  SearchError(this.message);
}

