import '../entities/entity.dart';

abstract class RecipeRepository {
  Future<List<RecipeEntity>> searchMeals(String query);
}
