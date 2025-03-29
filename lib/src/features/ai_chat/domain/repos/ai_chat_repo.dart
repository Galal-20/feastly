import 'package:dartz/dartz.dart';
import 'package:feastly/src/core/error/failures.dart';
import 'package:feastly/src/features/ai_chat/data/models/ai_result_model/ai_result_model.dart';

abstract class AiChatRepo {
  Future<Either<Failures, AiResultModel>> getAiChatResponse(String message);
}
