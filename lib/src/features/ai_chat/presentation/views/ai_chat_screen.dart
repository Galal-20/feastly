import 'package:feastly/src/core/DI/service_locator.dart';
import 'package:feastly/src/core/constants/keys.dart';
import 'package:feastly/src/features/ai_chat/domain/use_case/get_ai_chat_response_use_case.dart';
import 'package:feastly/src/features/ai_chat/domain/use_case/get_image_use_case.dart';
import 'package:feastly/src/features/ai_chat/presentation/view_model/ai_chat_bloc/ai_chat_bloc.dart';
import 'package:feastly/src/features/ai_chat/presentation/widgets/ai_chat_screen_body.dart';
import 'package:feastly/src/features/ai_chat/presentation/widgets/custom_ai_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gemini/flutter_gemini.dart';

class AiChatScreen extends StatelessWidget {
  const AiChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Gemini.init(apiKey: googleApiKey);

    return Scaffold(
      appBar: buildCustomAiAppBar(context),
      backgroundColor: Colors.white,
      body: BlocProvider(
        create: (context) =>
            AiChatBloc(sl<GetAiChatResponseUseCase>(), sl<GetImageUseCase>()),
        child: AiChatScreenBody(),
      ),
    );
  }
}
