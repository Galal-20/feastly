import 'package:dartz/dartz.dart';
import 'package:feastly/src/core/error/failures.dart';
import 'package:feastly/src/features/ai_chat/data/data_source/remote_data_source.dart';
import 'package:feastly/src/features/ai_chat/domain/entities/ai_chat_entity.dart';
import 'package:feastly/src/features/ai_chat/domain/repos/ai_chat_repo.dart';

class AiChatRepoImpl extends AiChatRepo {
  final AiRemoteDataSource aiRemoteDataSource;

  AiChatRepoImpl({required this.aiRemoteDataSource});
  @override
  Future<Either<Failures, AiChatEntity>> getAiChatResponse(
      String message) async {
    try {
      final result = await aiRemoteDataSource.getAiChatResponse(message);
      return Right(result);
    } catch (e) {
      if (e is GeminiFailures) {
        return Left(GeminiFailures(message: e.message));
      } else {
        return Left(UserFailures(message: e.toString()));
      }
    }
  }
}
