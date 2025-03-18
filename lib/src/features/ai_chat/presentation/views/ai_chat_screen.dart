import 'package:feastly/src/features/ai_chat/presentation/view_model/ai_chat_bloc/ai_chat_bloc.dart';
import 'package:feastly/src/features/ai_chat/presentation/widgets/ai_chat_screen_body.dart';
import 'package:feastly/src/features/ai_chat/presentation/widgets/custom_ai_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AiChatScreen extends StatelessWidget {
  const AiChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildCustomAiAppBar(context),
      backgroundColor: Colors.white,
      body: BlocProvider(
        create: (context) => AiChatBloc(),
        child: AiChatScreenBody(),
      ),
    );
  }
}
