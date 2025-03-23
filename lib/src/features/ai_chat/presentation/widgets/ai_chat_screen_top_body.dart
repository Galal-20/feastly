import 'package:feastly/src/features/ai_chat/presentation/view_model/ai_chat_bloc/ai_chat_bloc.dart';
import 'package:feastly/src/features/ai_chat/presentation/view_model/ai_chat_bloc/ai_chat_state.dart';
import 'package:feastly/src/features/ai_chat/presentation/widgets/custom_ai_error_widget.dart';
import 'package:feastly/src/features/ai_chat/presentation/widgets/custom_ai_food_container.dart';
import 'package:feastly/src/features/ai_chat/presentation/widgets/custom_ai_loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AiChatScreenTopWidget extends StatelessWidget {
  const AiChatScreenTopWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AiChatBloc, AiChatState>(
      builder: (context, state) {
        if (state is AiChatRecommendMealSuccess) {
          return CustomAiFoodContainer(
            aiChatEntity: state.aiChatEntity,
          );
        } else if (state is AiChatRecommendMealFail) {
          return CustomAiErrorWidget(errMsg: state.errMsg);
        } else if (state is AiChatRecommendMealLoading) {
          return CustomAiLoadingWidget();
        }
        return SizedBox();
      },
    );
  }
}
