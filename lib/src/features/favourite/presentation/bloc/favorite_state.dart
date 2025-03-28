part of 'favorite_bloc.dart';

sealed class FavoriteState extends Equatable {
  const FavoriteState();
  
  @override
  List<Object> get props => [];
}

final class FavoriteInitial extends FavoriteState {}
final class FavoriteLoading extends FavoriteState {}
final class FavoriteLoaded extends FavoriteState {
  final List<AiResultModel> favRecipes;

  const FavoriteLoaded(this.favRecipes);

  @override
  List<Object> get props => [favRecipes];
}
final class FavoriteError extends FavoriteState {
  final String message;

  const FavoriteError(this.message);

  @override
  List<Object> get props => [message];
}
final class FavoriteRecipeAdded extends FavoriteState {}
final class FavoriteRecipeRemoved extends FavoriteState {}
class FavIconToggled extends FavoriteState {}




