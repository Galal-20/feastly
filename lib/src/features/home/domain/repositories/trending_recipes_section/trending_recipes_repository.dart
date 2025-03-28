import 'package:dartz/dartz.dart';
import '../../../../../core/error/failures.dart';
import '../../entities/trending_recipes_section/trending_recipes_entity.dart';

abstract class TrendingRecipesRepository{
  Future<Either<Failures, TrendingRecipesEntity>> getTrendingRecipes();

}