import 'package:feastly/src/features/ai_chat/data/models/ai_result_model/ai_result_model.dart';

abstract class AiChatState {
  const AiChatState();
}

final class AiChatInitial extends AiChatState {}

final class AiChatRecommendMealLoading extends AiChatState {}

final class AiChatRecommendMealSuccess extends AiChatState {
  final AiResultModel aiChatEntity;

  AiChatRecommendMealSuccess({required this.aiChatEntity});
}

final class AiChatRecommendMealFail extends AiChatState {
  final String errMsg;

  AiChatRecommendMealFail({required this.errMsg});
}
