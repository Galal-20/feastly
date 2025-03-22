import 'dart:async';
import 'dart:developer';

import 'package:feastly/src/features/ai_chat/domain/entities/ai_chat_entity.dart';
import 'package:feastly/src/features/ai_chat/domain/use_case/get_ai_chat_response_use_case.dart';
import 'package:feastly/src/features/ai_chat/domain/use_case/get_image_use_case.dart';
import 'package:feastly/src/features/ai_chat/presentation/view_model/ai_chat_bloc/ai_chat_event.dart';
import 'package:feastly/src/features/ai_chat/presentation/view_model/ai_chat_bloc/ai_chat_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AiChatBloc extends Bloc<AiChatEvent, AiChatState> {
  final GetAiChatResponseUseCase getAiChatResponseUseCase;
  final GetImageUseCase getImageUseCase;
  final TextEditingController textEditingController = TextEditingController();
  AiChatBloc(this.getAiChatResponseUseCase, this.getImageUseCase)
      : super(AiChatInitial()) {
    on<AiChatRecommendMealEvent>(_recommendMeal);
    on<AiChatSendBtnEvent>(_sendBtnLogic);
    // on<GetImageEvent>(_getImage);
  }
  late AiChatEntity _result;
  Future<void> _recommendMeal(
      AiChatRecommendMealEvent event, Emitter<AiChatState> emit) async {
    emit(AiChatRecommendMealLoading());
    var result = await getAiChatResponseUseCase.call(event.inputText);
    await result.fold(
      (error) {
        log(error.message);
        emit(AiChatRecommendMealFail(errMsg: error.message));
      },
      (response) async {
        _result = response;
        _result.imageNetworkUrl = await getImageUrl(_result.foodName);
        log('image = ${_result.imageNetworkUrl}');
        emit(AiChatRecommendMealSuccess(aiChatEntity: _result));
      },
    );
  }

  Future<String> getImageUrl(String foodName) async {
    var result = await getImageUseCase.call(foodName);
    String imageUrl = '';
    result.fold(
      (error) {
        log(error.message);
        imageUrl = '';
      },
      (response) {
        log('here image = ${response.imageUrl}');

        imageUrl = response.imageUrl;
      },
    );
    return imageUrl;
  }
  //work manager
  // Future<String> _getImage(
  //     GetImageEvent event, Emitter<AiChatState> emit) async {
  //   var result = await getImageUseCase.call(event.foodName);
  //   result.fold(
  //     (error) {
  //       log(error.message);
  //       emit(AiChatRecommendMealFail(errMsg: error.message));
  //     },
  //     (response) {
  //       _result.imageNetworkUrl = response.imageUrl;
  //       emit(GetImageLoading());
  //     },
  //   );
  //   return '';
  // }

  FutureOr<void> _sendBtnLogic(
      AiChatSendBtnEvent event, Emitter<AiChatState> emit) async {
    await _recommendMeal(
        AiChatRecommendMealEvent(inputText: textEditingController.text), emit);
  }
}
