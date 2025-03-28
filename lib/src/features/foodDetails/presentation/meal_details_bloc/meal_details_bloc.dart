// Bloc Implementation
import 'dart:developer';
import 'package:feastly/src/features/favourite/data/data_sources/fav_data_source.dart';
import 'package:feastly/src/features/foodDetails/domain/use_cases/get_meal_details_use_case.dart';
import 'package:feastly/src/features/foodDetails/presentation/meal_details_bloc/meal_details_event.dart';
import 'package:feastly/src/features/foodDetails/presentation/meal_details_bloc/meal_details_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MealDetailsBloc extends Bloc<MealDetailsEvent, MealDetailsState> {
  final GetMealDetailsUseCase getMealDetailsUseCase;
  bool isFave = false;
  final FavDataSource favDataSource;
  MealDetailsBloc(this.favDataSource, {required this.getMealDetailsUseCase})
      : super(MealDetailsInitial()) {
    on<GetMealDetailsEvent>((event, emit) async {
      emit(MealDetailsLoading());
      /*
      if (event.id == '0') {
        final AiResultModel aiResultModel = event.aiResultModel!;
        final MealEntity meal = _handleAiReturnLogic(aiResultModel);
        emit(MealDetailsLoaded(meal: meal));
      } else {

      */
        final result = await getMealDetailsUseCase(id: event.id);
        log(result.toString());
        result.fold(
          (failure) => emit(MealDetailsError(message: failure.message)),
          (meal) {
            emit(MealDetailsLoaded(meal: event.aiResultModel!));
          },
        );
      
    });
    on<AddFavoriteRecipe>((event, emit) async {
      
      try {
        await favDataSource.storeRecipeAsFavFromAi(event.recipe);
      } catch (e) {
        emit(FavoriteError('Failed to add favourite recipe: $e'));
      }
    });
    on<RemoveFavoriteRecipe>((event, emit) async {
      try {
        await favDataSource.removeRecipeFromFav(event.recipe);
      } catch (e) {
        emit(FavoriteError('Failed to remove favourite recipe: $e'));
      }
    });
    on<ToggleFavIcon>((event, emit) async {
      isFave = !isFave;
      emit(FavIconToggled());

      
    });
  }

  /*
  MealEntity _handleAiReturnLogic(AiResultModel aiResultModel) {
    log(aiResultModel.directions.toString());
    String instructions = '';
    for (var element in aiResultModel.directions) {
      instructions += element;
    }
    List<String> ingrediants = [];
    List<String> measures = [];
    for (var element in aiResultModel.ingredients) {
      ingrediants.add(element.name);
      measures.add(element.quantity);
    }
    final MealEntity meal = MealEntity(
      idMeal: '0',
      strMeal: aiResultModel.foodTitle,
      ingredients: ingrediants,
      strInstructions: instructions,
      strCategory: aiResultModel.typeOfMeat,
      strArea: 'A.I. Generated',
      strMealThumb: aiResultModel.imageNetworkUrl,
      measures: measures,
    );
    return meal;
  }
  */
}

