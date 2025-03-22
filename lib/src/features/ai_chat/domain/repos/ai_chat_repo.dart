import 'package:dartz/dartz.dart';
import 'package:feastly/src/core/error/failures.dart';
import 'package:feastly/src/features/ai_chat/domain/entities/ai_chat_entity.dart';

abstract class AiChatRepo {
  Future<Either<Failures, AiChatEntity>> getAiChatResponse(String message);
}
