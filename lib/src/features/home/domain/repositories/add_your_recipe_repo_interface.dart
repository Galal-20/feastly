import 'package:feastly/src/features/home/domain/entities/add_your_recipe_entity.dart';

abstract class AddYourRecipeRepoInterface {
  Future storeUserRecipe({required AddYourRecipeEntity addYourRecipeEnitiy});
}
