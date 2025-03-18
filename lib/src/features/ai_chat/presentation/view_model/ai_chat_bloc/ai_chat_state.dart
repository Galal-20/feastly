part of 'ai_chat_bloc.dart';

sealed class AiChatState extends Equatable {
  const AiChatState();

  @override
  List<Object> get props => [];
}

final class AiChatInitial extends AiChatState {}

final class AiChatRecommendMealLoading extends AiChatState {}

final class AiChatRecommendMealSuccess extends AiChatState {}

final class AiChatRecommendMealFail extends AiChatState {}
