// Bloc Events
abstract class SearchedMealDetailsEvent {}

class GetSearchedMealDetailsEvent extends SearchedMealDetailsEvent {
  final String id;
  GetSearchedMealDetailsEvent({required this.id});
}
