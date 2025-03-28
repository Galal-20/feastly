import 'dart:developer';

import 'package:feastly/src/features/home/presentation/bloc/recommended_for_you_bloc/recommended_for_you_event.dart';
import 'package:feastly/src/features/home/presentation/bloc/recommended_for_you_bloc/recommended_for_you_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../ai_chat/domain/use_case/get_image_use_case.dart';
import '../../../domain/usecases/recommended_for_you_section/recommended_for_you_usecase.dart';
import '../../mapper/model_mapper.dart';

class RecommendedForYouBloc
    extends Bloc<RecommendedForYouEvent, RecommendedForYouState> {
  final GetRecommendedMealsUseCase getRecommendedMealsUseCase;
  final GetImageUseCase getImageUseCase;

  RecommendedForYouBloc(
    this.getRecommendedMealsUseCase,
    this.getImageUseCase,
  ) : super(RecommendedForYouInitial()) {
    on<HomeRecommendedForYouEvent>(_getRecommendedMeals);
    on<MapMealForDetailsEvent>(_mapMealForDetails);
  }

  Future<void> _getRecommendedMeals(HomeRecommendedForYouEvent event,
      Emitter<RecommendedForYouState> emit) async {
    if (event.isLoaded) {
      emit(RecommendedForYouSuccess(recommendedForYouEntity: null));
    } else {
      emit(RecommendedForYouLoading());

      final result = await getRecommendedMealsUseCase.call();
      result.fold(
        (error) {
          log(error.message);
          emit(RecommendedForYouError(message: error.message));
        },
        (response) {
          emit(RecommendedForYouSuccess(recommendedForYouEntity: response));
        },
      );
    }
  }

  void _mapMealForDetails(
      MapMealForDetailsEvent event, Emitter<RecommendedForYouState> emit) {
    final mappedMeal = MealsMapper.mapRecommendedMeal(event.meal);
    print('this is the mealllll ${event.meal}');
    print('mapper meal isssssssssssssssssss $mappedMeal');
    emit(RecommendedForYouMapped(mappedMeal: mappedMeal));
  }
}
