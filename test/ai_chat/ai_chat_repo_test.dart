import 'package:dartz/dartz.dart';
import 'package:feastly/src/core/error/failures.dart';
import 'package:feastly/src/features/ai_chat/data/data_source/remote_data_source.dart';
import 'package:feastly/src/features/ai_chat/data/repos/ai_chat_repo_impl.dart';
import 'package:feastly/src/features/ai_chat/domain/entities/ai_chat_entity.dart';
import 'package:feastly/src/features/ai_chat/domain/use_case/get_ai_chat_response_use_case.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'ai_chat_repo_test.mocks.dart';

@GenerateMocks([AiRemoteDataSource])
void main() {
  late GetAiChatResponseUseCase getAiChatResponseUseCase;
  late AiChatRepoImpl aiChatRepoImpl;
  late MockAiRemoteDataSource mockAiRemoteDataSource;
  setUp(() {
    mockAiRemoteDataSource = MockAiRemoteDataSource();
    aiChatRepoImpl = AiChatRepoImpl(aiRemoteDataSource: mockAiRemoteDataSource);
    getAiChatResponseUseCase =
        GetAiChatResponseUseCase(aiChatRepo: aiChatRepoImpl);
  });

  test(
    'Test Get Food Recommendation from user input',
    () async {
      const prompt = 'chicken and salad';
      final AiChatEntity aiChatEntity = AiChatEntity(
        foodName: 'chicken and salad',
        imageNetworkUrl: 'https://example.com/image.jpg',
        noOfIngredients: 10,
        time: 50,
      );

      when(mockAiRemoteDataSource.getAiChatResponse(prompt)).thenAnswer(
        (_) async => aiChatEntity,
      );

      final result = await getAiChatResponseUseCase.call(prompt);

      verify(mockAiRemoteDataSource.getAiChatResponse(prompt)).called(1);

      expect(result, Right<Failures, AiChatEntity>(aiChatEntity));
    },
  );
  test(
    'Test Get Food Recommendation fail from incorrect user input',
    () async {
      const prompt = 'dsfadasfafdsadfadsf';
      final GeminiException geminiException = GeminiException(
        'Food or ingredient not recognized',
      );

      final GeminiFailures geminiFailures =
          GeminiFailures(message: geminiException.message.toString());

      when(mockAiRemoteDataSource.getAiChatResponse(prompt)).thenThrow(
        geminiException,
      );

      final result = await getAiChatResponseUseCase.call(prompt);

      verify(mockAiRemoteDataSource.getAiChatResponse(prompt)).called(1);

      expect(result, Left<Failures, AiChatEntity>(geminiFailures));
    },
  );
}
