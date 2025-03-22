// Bloc Events
abstract class MealDetailsEvent {}

class GetMealDetailsEvent extends MealDetailsEvent {
  final String id;
  GetMealDetailsEvent({required this.id});
}
