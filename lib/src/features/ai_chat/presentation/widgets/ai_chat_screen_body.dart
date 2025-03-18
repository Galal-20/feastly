import 'package:feastly/src/core/utils/size_config.dart';
import 'package:feastly/src/features/ai_chat/presentation/widgets/custom_ai_food_container.dart';
import 'package:feastly/src/features/ai_chat/presentation/widgets/custom_ai_text_field.dart';
import 'package:flutter/material.dart';

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
          Expanded(child: CustomAiFoodContainer()),
          CustomAiTextField(),
        ],
      ),
    );
  }
}
