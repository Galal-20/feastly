abstract class AiChatEvent {}

class AiChatRecommendMealEvent extends AiChatEvent {
  final String inputText;

  AiChatRecommendMealEvent({required this.inputText});
}

class AiChatSendBtnEvent extends AiChatEvent {}
