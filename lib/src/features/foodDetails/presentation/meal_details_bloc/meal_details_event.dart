// Bloc Events
import 'package:feastly/src/features/ai_chat/data/models/ai_result_model/ai_result_model.dart';

abstract class MealDetailsEvent {}

class GetMealDetailsEvent extends MealDetailsEvent {
  final String id;
  final AiResultModel? aiResultModel;
  GetMealDetailsEvent({required this.id, this.aiResultModel});
}
