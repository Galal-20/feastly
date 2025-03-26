import 'dart:developer';

import 'package:feastly/src/features/home/presentation/bloc/recommended_for_you_bloc/recommended_for_you_event.dart';
import 'package:feastly/src/features/home/presentation/bloc/recommended_for_you_bloc/recommended_for_you_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../ai_chat/domain/use_case/get_image_use_case.dart';
import '../../../domain/usecases/recommended_for_you_section/recommended_for_you_usecase.dart';

class RecommendedForYouBloc
    extends Bloc<RecommendedForYouEvent, RecommendedForYouState> {
  final GetRecommendedMealsUseCase getRecommendedMealsUseCase;
  final GetImageUseCase getImageUseCase;

  RecommendedForYouBloc(this.getRecommendedMealsUseCase,this.getImageUseCase,)
      : super(RecommendedForYouInitial()) {
    on<HomeRecommendedForYouEvent>(_getRecommendedMeals);
  }


  Future<void> _getRecommendedMeals(
      HomeRecommendedForYouEvent event, Emitter<RecommendedForYouState> emit) async {
    emit(RecommendedForYouLoading());

    final result = await getRecommendedMealsUseCase.call();
    result.fold(
          (error) {
        log(error.message);
        emit(RecommendedForYouError(message: error.message));
      },
          (response) {
            print('helloooooooooooooooooo');
            print(response);
        emit(RecommendedForYouSuccess(recommendedForYouEntity: response));
      },
    );


}}
