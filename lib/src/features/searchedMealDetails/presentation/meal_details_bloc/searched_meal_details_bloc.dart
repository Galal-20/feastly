// Bloc Implementation
import 'dart:developer';

import 'package:feastly/src/features/searchedMealDetails/domain/use_cases/get_searched_meal_details_use_case.dart';
import 'package:feastly/src/features/searchedMealDetails/presentation/meal_details_bloc/searched_meal_details_event.dart';
import 'package:feastly/src/features/searchedMealDetails/presentation/meal_details_bloc/searched_meal_details_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchedMealDetailsBloc extends Bloc<SearchedMealDetailsEvent, SearchedMealDetailsState> {
  final GetSearchedMealDetailsUseCase getSearchedMealDetailsUseCase;
  SearchedMealDetailsBloc({required this.getSearchedMealDetailsUseCase})
      : super(SearchedMealDetailsInitial()) {
    on<GetSearchedMealDetailsEvent>((event, emit) async {
      emit(SearchedMealDetailsLoading());
      final result = await getSearchedMealDetailsUseCase(id: event.id);
      log(result.toString());
      result.fold(
        (failure) => emit(SearchedMealDetailsError(message: failure.message)),
        (meal) {
          emit(SearchedMealDetailsLoaded(meal: meal));
        },
      );
    });
  }
}
