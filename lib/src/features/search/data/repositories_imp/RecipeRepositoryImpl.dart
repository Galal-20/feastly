//
// import 'package:feastly/src/features/search/domain/repositories/RecipeRepository.dart';
//
// import '../../domain/entities/entity.dart';
// import '../data_sources/RecipeRemote.dart';
//
// class RecipeRepositoryImpl implements RecipeRepository {
//   final RecipeRemoteDataSource remoteDataSource;
//
//   RecipeRepositoryImpl(this.remoteDataSource);
//
//   @override
//   Future<List<RecipeEntity>> searchMeals(String query) async {
//     try {
//       final models = await remoteDataSource.searchMeals(query);
//       return models.map((model) => RecipeEntity(
//         idMeal: model.idMeal,
//         strMeal: model.strMeal,
//         strCategory: model.strCategory,
//         strArea: model.strArea,
//         strMealThumb: model.strMealThumb,
//       )).toList();
//     } catch (e) {
//       throw Exception("Failed to fetch meals: $e");
//     }
//   }
// }
import '../../domain/entities/entity.dart';
import '../../domain/repositories/RecipeRepository.dart';
import '../data_sources/RecipeRemote.dart';

class RecipeRepositoryImpl implements RecipeRepository {
  final RecipeRemoteDataSource remoteDataSource;

  RecipeRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<RecipeEntity>> searchMeals(String query) async {
    try {
      final models = await remoteDataSource.searchMeals(query);
      return models.map((model) => RecipeEntity(
        idMeal: model.idMeal,
        strMeal: model.strMeal,
        strCategory: model.strCategory,
        strArea: model.strArea,
        strMealThumb: model.strMealThumb,
      )).toList();
    } catch (e) {
      throw Exception("Failed to fetch meals: $e");
    }
  }

// Optional: implement other filter methods if needed.
}


/*
class RecipeRepositoryImpl implements RecipeRepository {
  final RecipeRemoteDataSource remoteDataSource;

  RecipeRepositoryImpl(this.remoteDataSource);

  */
/*@override
  Future<List<RecipeEntity>> searchMeals(String query) async {
    return await remoteDataSource.searchMeals(query);
  }*//*

  @override
  Future<List<RecipeEntity>> searchMeals(String query) async {
    try {
      return await remoteDataSource.searchMeals(query);
    } catch (e) {
      throw Exception("Failed to fetch meals: $e");
    }
  }


}
*/
