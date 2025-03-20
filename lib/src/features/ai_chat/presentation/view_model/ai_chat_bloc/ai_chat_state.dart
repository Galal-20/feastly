import 'package:feastly/src/features/ai_chat/domain/entities/ai_chat_entity.dart';

abstract class AiChatState {
  const AiChatState();
}

final class AiChatInitial extends AiChatState {}

final class AiChatRecommendMealLoading extends AiChatState {}

final class AiChatRecommendMealSuccess extends AiChatState {
  final AiChatEntity aiChatEntity;

  const AiChatRecommendMealSuccess({required this.aiChatEntity});
}

final class AiChatRecommendMealFail extends AiChatState {
  final String errMsg;

  const AiChatRecommendMealFail({required this.errMsg});
}
