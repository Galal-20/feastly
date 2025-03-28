import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:feastly/src/core/error/failures.dart';
import 'package:feastly/src/features/home/data/data_sources/recommended_for_you_section/recommended_for_you_remote_data_source.dart';
import 'package:feastly/src/features/home/domain/entities/recommended_for_you_section/recommended_for_you_entity.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import '../../../domain/repositories/recommended_for_you_section/recommended_for_you_repository.dart';

  class RecommendedForYouRepositoryImpl implements RecommendedForYouRepository{

  final RecommendedForYouRemoteDataSource  recommendedForYouRemoteDataSource;
  RecommendedForYouRepositoryImpl({required this.recommendedForYouRemoteDataSource});

  @override
  Future<Either<Failures, RecommendedForYouEntity>> getRecommendedMeals() async {
    try {      print('this is before repo impllllllll');

    final result = await recommendedForYouRemoteDataSource.getRecommendedMeals();
      print('this is from repo impllllllll');
      print(result);
      return Right(result);
    } catch (e) {
      if (e is GeminiException) {
        log('error: ${e.message}');
        return Left(GeminiFailures(message: e.message.toString()));
      } else {
        return Left(UserFailures(message: e.toString()));
      }
    }
  }}