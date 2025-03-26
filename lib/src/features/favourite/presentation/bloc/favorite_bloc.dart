import 'package:equatable/equatable.dart';
import 'package:feastly/src/features/ai_chat/data/models/ai_result_model/ai_result_model.dart';
import 'package:feastly/src/features/favourite/domain/usecases/add_fav_recipe_usecase.dart';
import 'package:feastly/src/features/favourite/domain/usecases/fetch_fav_usecase.dart';
import 'package:feastly/src/features/favourite/domain/usecases/remove_fav_recipe_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'favorite_event.dart';
part 'favorite_state.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  final FetchFavUsecase fetchFavUsecase;
  final AddFavRecipeUsecase addFavRecipeUsecase;
  final RemoveFavRecipeUsecase removeFavRecipeUsecase;
  bool isFave = true;
  List<AiResultModel> favRecipes = [];

  FavoriteBloc(this.fetchFavUsecase, this.addFavRecipeUsecase,
      this.removeFavRecipeUsecase)
      : super(FavoriteInitial()) {
    on<FetchFavoriteRecipes>((event, emit) async {
      emit(FavoriteLoading());

      try {
        await emit.forEach<List<AiResultModel>>(
          fetchFavUsecase.call(),
          onData: (favRecipes) => FavoriteLoaded(favRecipes),
          onError: (error, stackTrace) =>
              FavoriteError("Failed to fetch favourite recipes: $error"),
        );
      } catch (e) {
        emit(FavoriteError("Failed to fetch favourite recipes: $e"));
      }
    });

    on<AddFavoriteRecipe>((event, emit) async {
      if (state is FavoriteLoaded) {
        final currentFavorites = (state as FavoriteLoaded).favRecipes;
        emit(FavoriteLoaded([...currentFavorites, event.recipe]));
      }

      try {
        await addFavRecipeUsecase.call(event.recipe);
        emit(FavoriteRecipeAdded());
      } catch (e) {
        emit(FavoriteError('Failed to add favourite recipe: $e'));
      }
    });

    on<RemoveFavoriteRecipe>((event, emit) async {
      if (state is FavoriteLoaded) {
        final currentFavorites = (state as FavoriteLoaded).favRecipes;
        emit(FavoriteLoaded(
            currentFavorites.where((r) => r != event.recipe).toList()));
      }

      try {
        await removeFavRecipeUsecase.call(event.recipe);
        emit(FavoriteRecipeRemoved());
      } catch (e) {
        emit(FavoriteError('Failed to remove favourite recipe: $e'));
      }
    });

    on<ToggleFavIcon>((event, emit) async {
      isFave = !isFave;
      emit(FavIconToggled());
    });
  }
}
