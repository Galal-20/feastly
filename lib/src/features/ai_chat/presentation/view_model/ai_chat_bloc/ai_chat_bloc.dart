import 'dart:async';
import 'dart:developer';

import 'package:feastly/src/features/ai_chat/domain/use_case/get_ai_chat_response_use_case.dart';
import 'package:feastly/src/features/ai_chat/presentation/view_model/ai_chat_bloc/ai_chat_event.dart';
import 'package:feastly/src/features/ai_chat/presentation/view_model/ai_chat_bloc/ai_chat_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AiChatBloc extends Bloc<AiChatEvent, AiChatState> {
  final GetAiChatResponseUseCase getAiChatResponseUseCase;
  final TextEditingController textEditingController = TextEditingController();
  AiChatBloc(this.getAiChatResponseUseCase) : super(AiChatInitial()) {
    on<AiChatRecommendMealEvent>(_recommendMeal);
    on<AiChatSendBtnEvent>(_sendBtnLogic);
  }

  FutureOr<void> _recommendMeal(
      AiChatRecommendMealEvent event, Emitter<AiChatState> emit) async {
    emit(AiChatRecommendMealLoading());
    var result = await getAiChatResponseUseCase.call(event.inputText);
    result.fold((error) {
      log(error.message);
      emit(AiChatRecommendMealFail(errMsg: error.message));
    }, (response) {
      emit(AiChatRecommendMealSuccess(aiChatEntity: response));
    });
  }

  FutureOr<void> _sendBtnLogic(
      AiChatSendBtnEvent event, Emitter<AiChatState> emit) async {
    await _recommendMeal(
        AiChatRecommendMealEvent(inputText: textEditingController.text), emit);
  }
}
