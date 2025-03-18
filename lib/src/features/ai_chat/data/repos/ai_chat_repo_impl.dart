import 'package:dartz/dartz.dart';
import 'package:feastly/src/core/error/failures.dart';
import 'package:feastly/src/features/ai_chat/domain/entities/ai_chat_entity.dart';
import 'package:feastly/src/features/ai_chat/domain/repos/ai_chat_repo.dart';

class AiChatRepoImpl extends AiChatRepo {
  @override
  Future<Either<Failures, AiChatEntity>> getAiChatResponse(String message) {
    // TODO: implement getAiChatResponse
    throw UnimplementedError();
  }
}
