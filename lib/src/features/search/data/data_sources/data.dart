import 'package:dio/dio.dart';
import '../models/model.dart';

abstract class RecipeRemoteDataSource {
  Future<List<RecipeModel>> searchMeals(String query);
}

class RecipeRemoteDataSourceImpl implements RecipeRemoteDataSource {
  final Dio dio;

  RecipeRemoteDataSourceImpl(this.dio);

  @override
  Future<List<RecipeModel>> searchMeals(String query) async {
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
  }
}
