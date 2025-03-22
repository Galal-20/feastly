// Bloc Implementation
import 'dart:developer';

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
      final result = await getMealDetailsUseCase(id: event.id);
      log(result.toString());
      result.fold(
        (failure) => emit(MealDetailsError(message: failure.errormessage)),
        (meal) {
          emit(MealDetailsLoaded(meal: meal));
        },
      );
    });
  }
}
