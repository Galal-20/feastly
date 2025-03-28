// import '../entities/entity.dart';
//
// abstract class RecipeRepository {
//   Future<List<RecipeEntity>> searchMeals(String query);
// }
import 'package:feastly/src/features/foodDetails/domain/entities/meal_entity.dart';


abstract class RecipeRepository {
  Future<List<MealEntity>> searchMeals(String query);
}
