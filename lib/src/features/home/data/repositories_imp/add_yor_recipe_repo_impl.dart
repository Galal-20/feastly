import 'package:feastly/src/features/home/data/data_sources/add_yor_recipe_data_source.dart';
import 'package:feastly/src/features/home/data/models/add_your_recipe_model.dart';
import 'package:feastly/src/features/home/domain/entities/add_your_recipe_entity.dart';
import 'package:feastly/src/features/home/domain/repositories/add_your_recipe_repo_interface.dart';
import 'package:flutter/widgets.dart';

class AddYourRecipeRepoImpl implements AddYourRecipeRepoInterface {
  final AddYourRecipeDataSourceAbstract addYourRecipeDataSourceAbstract;

  AddYourRecipeRepoImpl({required this.addYourRecipeDataSourceAbstract});

  @override
  Future storeUserRecipe(
      {required AddYourRecipeEntity addYourRecipeEnitiy}) async {
    final AddYourRecipeModel addYourRecipeModel = AddYourRecipeModel(
      mealImage: addYourRecipeEnitiy.mealImage,
      mealType: addYourRecipeEnitiy.mealType,
      mealName: addYourRecipeEnitiy.mealName,
      ingrediantsNo: addYourRecipeEnitiy.ingrediantsNo,
      cookingTime: addYourRecipeEnitiy.cookingTime,
      summary: addYourRecipeEnitiy.summary,
      protine: addYourRecipeEnitiy.protine,
      carb: addYourRecipeEnitiy.carb,
      fats: addYourRecipeEnitiy.fats,
      kcal: addYourRecipeEnitiy.kcal,
      vitamins: addYourRecipeEnitiy.vitamins,
      ingredinat1: addYourRecipeEnitiy.ingredinat1,
      piece1: addYourRecipeEnitiy.piece1,
      ingredinat2: addYourRecipeEnitiy.ingredinat2,
      piece2: addYourRecipeEnitiy.piece2,
      ingredinat3: addYourRecipeEnitiy.ingredinat3,
      piece3: addYourRecipeEnitiy.piece3,
      ingredinat4: addYourRecipeEnitiy.ingredinat4,
      piece4: addYourRecipeEnitiy.piece4,
      steps: addYourRecipeEnitiy.steps,
    );

    await addYourRecipeDataSourceAbstract.storeUserRecipe(
      addYourRecipeModel: addYourRecipeModel,
    );
    debugPrint("data in repoooo immpppllll");
  }
}
