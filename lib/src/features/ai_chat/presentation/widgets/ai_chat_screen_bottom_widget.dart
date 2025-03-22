import 'package:feastly/src/features/ai_chat/presentation/view_model/ai_chat_bloc/ai_chat_bloc.dart';
import 'package:feastly/src/features/ai_chat/presentation/view_model/ai_chat_bloc/ai_chat_event.dart';
import 'package:feastly/src/features/ai_chat/presentation/view_model/ai_chat_bloc/ai_chat_state.dart';
import 'package:feastly/src/features/ai_chat/presentation/widgets/custom_ai_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AiChatScreenBottomWidget extends StatelessWidget {
  const AiChatScreenBottomWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AiChatBloc, AiChatState>(
      builder: (context, state) {
        return CustomAiTextField(
          onSubmitted: (text) {
            context
                .read<AiChatBloc>()
                .add(AiChatRecommendMealEvent(inputText: text));
          },
          controller: context.read<AiChatBloc>().textEditingController,
          onIconTap: () {
            FocusManager.instance.primaryFocus?.unfocus();
            context.read<AiChatBloc>().add(AiChatSendBtnEvent());
          },
          enabled: state is! AiChatRecommendMealLoading,
        );
      },
    );
  }
}
