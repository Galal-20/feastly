import 'package:dartz/dartz.dart';
import 'package:feastly/src/core/error/failures.dart';
import 'package:feastly/src/core/use_case/default_use_case.dart';
import 'package:feastly/src/features/ai_chat/data/models/ai_result_model/ai_result_model.dart';
import 'package:feastly/src/features/ai_chat/domain/repos/ai_chat_repo.dart';

class GetAiChatResponseUseCase extends UseCase<AiResultModel, String> {
  final AiChatRepo aiChatRepo;

  GetAiChatResponseUseCase({required this.aiChatRepo});
  @override
  Future<Either<Failures, AiResultModel>> call([String? param]) {
    return aiChatRepo.getAiChatResponse(param!);
  }
}
