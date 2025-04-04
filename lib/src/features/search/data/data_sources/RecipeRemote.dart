// import 'package:dio/dio.dart';
// import '../models/model.dart';
//
// abstract class RecipeRemoteDataSource {
//   Future<List<RecipeModel>> searchMeals(String query);
// }
//
// class RecipeRemoteDataSourceImpl implements RecipeRemoteDataSource {
//   final Dio dio;
//
//   RecipeRemoteDataSourceImpl(this.dio);

/*  @override
  Future<List<RecipeModel>> searchMeals(String query) async {
    try{
      final response = await dio.get(
        "https://www.themealdb.com/api/json/v1/1/search.php?s=$query",
      );

      if (response.statusCode == 200) {
        final meals = response.data['meals'] as List?;
        if (meals != null) {
          return meals.map((meal) => RecipeModel.fromJson(meal)).toList();
        } else {
          return [];
        }
      } else {
        throw Exception('Failed to load meals');
      }
    }catch(e){
      throw Exception("Network Error: $e");
    }
  }*/

//   @override
//   Future<List<RecipeModel>> searchMeals(String query) async {
//     try {
//       final response = await dio.get("https://www.themealdb.com/api/json/v1/1/search.php?s=$query");
//
//       if (response.statusCode == 200) {
//         final meals = response.data['meals'] as List?;
//         return meals != null
//             ? meals.map((meal) => RecipeModel.fromJson(meal)).toList()
//             : [];
//       }
//       throw DioException(requestOptions: response.requestOptions, response: response);
//     } on DioException catch (e) {
//       throw Exception("Dio Error: ${e.message}");
//     } catch (e) {
//       throw Exception("Unexpected Error: $e");
//     }
//   }
// }

import 'package:dio/dio.dart';
import 'package:feastly/src/features/foodDetails/data/models/meal.dart';

abstract class RecipeRemoteDataSource {
  Future<List<Meal>> searchMeals(String query);
}

class RecipeRemoteDataSourceImpl implements RecipeRemoteDataSource {
  final Dio dio;

  RecipeRemoteDataSourceImpl(this.dio);

  @override
  Future<List<Meal>> searchMeals(String query) async {
    try {
      final response = await dio.get(
          "https://www.themealdb.com/api/json/v1/1/search.php?s=$query"
      );

      if (response.statusCode == 200) {
        final meals = response.data['meals'] as List?;
        return meals != null
            ? meals.map((meal) => Meal.fromJson(meal)).toList()
            : [];
      }
      throw DioException(
        requestOptions: response.requestOptions,
        response: response,
      );
    } on DioException catch (e) {
      throw Exception("Dio Error: ${e.message}");
    } catch (e) {
      throw Exception("Unexpected Error: $e");
    }
  }
}
