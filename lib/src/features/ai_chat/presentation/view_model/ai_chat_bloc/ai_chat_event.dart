part of 'ai_chat_bloc.dart';

sealed class AiChatEvent extends Equatable {
  const AiChatEvent();

  @override
  List<Object> get props => [];
}

class AiChatRecommendMealEvent extends AiChatEvent {
  final String inputText;

  const AiChatRecommendMealEvent({required this.inputText});
}
