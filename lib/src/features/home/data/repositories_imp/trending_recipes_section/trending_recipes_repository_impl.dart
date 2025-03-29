import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:feastly/src/core/error/failures.dart';
import 'package:feastly/src/features/home/data/data_sources/trending_recipes_section/trending_recipes_remote_data_source.dart';
import 'package:feastly/src/features/home/data/models/trending_recipes_model/trending_recipes_response_model.dart';
import 'package:feastly/src/features/home/domain/entities/trending_recipes_section/trending_recipes_entity.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import '../../../domain/repositories/trending_recipes_section/trending_recipes_repository.dart';

class TrendingRecipesRepositoryImpl implements TrendingRecipesRepository{

  final TrendingRecipesRemoteDataSource  trendingRecipesRemoteDataSource;
  TrendingRecipesRepositoryImpl({required this.trendingRecipesRemoteDataSource});

  @override
  Future<Either<Failures, TrendingRecipesEntity>> getTrendingRecipes() async {
    try {
      final result = await trendingRecipesRemoteDataSource.getTrendingRecipes();
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