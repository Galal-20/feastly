import 'package:feastly/src/features/home/domain/entities/recommended_for_you_section/recommended_for_you_entity.dart';

abstract class RecommendedForYouState {}

class RecommendedForYouInitial extends RecommendedForYouState {}

class RecommendedForYouLoading extends RecommendedForYouState {}

class RecommendedForYouSuccess extends RecommendedForYouState {
  final RecommendedForYouEntity recommendedForYouEntity;
  RecommendedForYouSuccess({required this.recommendedForYouEntity});
}

class RecommendedForYouError extends RecommendedForYouState {
  final String message;
  RecommendedForYouError({required this.message});
}
