import 'package:feastly/src/features/ai_chat/presentation/widgets/ai_chat_screen_body.dart';
import 'package:flutter/material.dart';

class AiChatScreen extends StatelessWidget {
  const AiChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'AI Chat',
          style: Theme.of(context).textTheme.displayLarge,
        ),
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: Colors.white,
      body: AiChatScreenBody(),
    );
  }
}
