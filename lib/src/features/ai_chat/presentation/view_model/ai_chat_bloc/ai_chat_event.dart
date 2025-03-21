abstract class AiChatEvent {}

class AiChatRecommendMealEvent extends AiChatEvent {
  final String inputText;

  AiChatRecommendMealEvent({required this.inputText});
}

class AiChatSendBtnEvent extends AiChatEvent {}

// class GetImageEvent extends AiChatEvent {
//   final String foodName;

//   GetImageEvent({required this.foodName});
// }
