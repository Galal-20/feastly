import 'package:feastly/src/features/ai_chat/data/models/ai_result_model/ai_result_model.dart';
import 'package:feastly/src/features/home/domain/entities/add_your_recipe_entity.dart';

abstract class AddYourRecipeRepoInterface {
  Future storeUserRecipe({required AddYourRecipeEntity addYourRecipeEnitiy});
  Future<AiResultModel> getMealById({required String mealID});
}
