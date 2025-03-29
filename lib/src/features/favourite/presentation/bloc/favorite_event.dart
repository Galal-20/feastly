part of 'favorite_bloc.dart';

sealed class FavoriteEvent extends Equatable {
  const FavoriteEvent();  
  @override
  List<Object> get props => [];
}
class FetchFavoriteRecipes extends FavoriteEvent {}
  class AddFavoriteRecipe extends FavoriteEvent {
  final AiResultModel recipe;
  const AddFavoriteRecipe(this.recipe);
} 
class RemoveFavoriteRecipe extends FavoriteEvent {
  final AiResultModel recipe;
  const RemoveFavoriteRecipe(this.recipe);
}
class ToggleFavIcon extends FavoriteEvent {}
