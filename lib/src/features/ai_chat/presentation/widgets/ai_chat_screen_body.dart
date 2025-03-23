import 'package:feastly/src/core/utils/size_config.dart';
import 'package:feastly/src/features/ai_chat/presentation/widgets/ai_chat_screen_bottom_widget.dart';
import 'package:feastly/src/features/ai_chat/presentation/widgets/ai_chat_screen_top_body.dart';
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
          Expanded(
            child: SingleChildScrollView(child: AiChatScreenTopWidget()),
          ),
          AiChatScreenBottomWidget(),
        ],
      ),
    );
  }
}
