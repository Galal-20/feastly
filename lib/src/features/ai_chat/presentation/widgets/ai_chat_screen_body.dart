import 'package:feastly/src/core/utils/size_config.dart';
import 'package:feastly/src/features/ai_chat/presentation/view_model/ai_chat_bloc/ai_chat_bloc.dart';
import 'package:feastly/src/features/ai_chat/presentation/view_model/ai_chat_bloc/ai_chat_event.dart';
import 'package:feastly/src/features/ai_chat/presentation/view_model/ai_chat_bloc/ai_chat_state.dart';
import 'package:feastly/src/features/ai_chat/presentation/widgets/custom_ai_food_container.dart';
import 'package:feastly/src/features/ai_chat/presentation/widgets/custom_ai_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AiChatScreenBody extends StatelessWidget {
  const AiChatScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: SizeConfig.height * 0.03,
        horizontal: SizeConfig.width * 0.03,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: BlocBuilder<AiChatBloc, AiChatState>(
            builder: (context, state) {
              if (state is AiChatRecommendMealSuccess) {
                return CustomAiFoodContainer(
                  aiChatEntity: state.aiChatEntity,
                );
              } else if (state is AiChatRecommendMealFail) {
                return Text(state.errMsg);
              }
              return SizedBox();
            },
          )),
          CustomAiTextField(
            onSubmitted: (text) {
              context
                  .read<AiChatBloc>()
                  .add(AiChatRecommendMealEvent(inputText: text));
            },
          ),
        ],
      ),
    );
  }
}
