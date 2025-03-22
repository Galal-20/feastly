// Bloc States
import 'package:feastly/src/features/foodDetails/domain/entities/meal_entity.dart';

abstract class MealDetailsState {}

class MealDetailsInitial extends MealDetailsState {}
class MealDetailsLoading extends MealDetailsState {}
class MealDetailsLoaded extends MealDetailsState {
  final MealEntity meal;
  MealDetailsLoaded({required this.meal});
}
class MealDetailsError extends MealDetailsState {
  final String message;
  MealDetailsError({required this.message});
}
