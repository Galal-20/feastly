import 'package:feastly/src/features/ai_chat/data/models/ai_result_model/ai_result_model.dart';
import 'package:feastly/src/features/home/domain/entities/add_your_recipe_entity.dart';
import 'package:feastly/src/features/home/domain/repositories/add_your_recipe_repo_interface.dart';

class AddYourRecipeUsecase {
  final AddYourRecipeRepoInterface addYourRecipeRepoInterface;

  AddYourRecipeUsecase({required this.addYourRecipeRepoInterface});

  Future storeUserRecipe({required AddYourRecipeEntity addYourRecipeEnitiy}) async {
    return await addYourRecipeRepoInterface.storeUserRecipe(
        addYourRecipeEnitiy: addYourRecipeEnitiy);
  }

  Future<AiResultModel> getMealById({required String mealID}) async {
    return await addYourRecipeRepoInterface.getMealById(mealID: mealID);
  }
}