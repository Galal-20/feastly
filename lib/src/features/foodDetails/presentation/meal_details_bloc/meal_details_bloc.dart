// Bloc Implementation
import 'dart:developer';

import 'package:feastly/src/features/ai_chat/data/models/ai_result_model/ai_result_model.dart';
import 'package:feastly/src/features/foodDetails/domain/entities/meal_entity.dart';
import 'package:feastly/src/features/foodDetails/domain/use_cases/get_meal_details_use_case.dart';
import 'package:feastly/src/features/foodDetails/presentation/meal_details_bloc/meal_details_event.dart';
import 'package:feastly/src/features/foodDetails/presentation/meal_details_bloc/meal_details_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MealDetailsBloc extends Bloc<MealDetailsEvent, MealDetailsState> {
  final GetMealDetailsUseCase getMealDetailsUseCase;
  MealDetailsBloc({required this.getMealDetailsUseCase})
      : super(MealDetailsInitial()) {
    on<GetMealDetailsEvent>((event, emit) async {
      emit(MealDetailsLoading());
      if (event.id == '0') {
        final AiResultModel aiResultModel = event.aiResultModel!;
        final MealEntity meal = _handleAiReturnLogic(aiResultModel);
        emit(MealDetailsLoaded(meal: meal));
      } else {
        final result = await getMealDetailsUseCase(id: event.id);
        log(result.toString());
        result.fold(
          (failure) => emit(MealDetailsError(message: failure.message)),
          (meal) {
            emit(MealDetailsLoaded(meal: meal));
          },
        );
      }
    });
  }
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
}
