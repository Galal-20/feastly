import 'package:feastly/src/core/app_router/app_routes.dart';
import 'package:feastly/src/core/components/recipe_card.dart';
import 'package:feastly/src/core/constants/colors.dart';
import 'package:feastly/src/features/home/presentation/bloc/add_your_recipe_bloc/add_your_recipe_bloc.dart';
import 'package:feastly/src/features/home/presentation/bloc/add_your_recipe_bloc/add_your_recipe_event.dart';
import 'package:feastly/src/features/home/presentation/bloc/add_your_recipe_bloc/add_your_recipe_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/components/UserRecipeCard.dart';

class BuildUserRecipesListView extends StatelessWidget {
  const BuildUserRecipesListView({super.key, required this.recipesType});
  final String recipesType;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            recipesType,
            style: Theme.of(context).textTheme.displaySmall,
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 160,
            child: BlocConsumer<AddYourRecipeBloc, AddYourRecipeState>(
              listener: (context, state) {
                if (state is SingleRecipeByIDFetched) {
                  context.push(
                    AppRoutes.kFoodDetailsScreen,
                    extra: {'meal': state.recipe , 'isFav': false , 'isFromHome': true},
                  ).then((_) {
                    context.read<AddYourRecipeBloc>().add(FetchRecipeEvent());
                  });
                }
              },
              builder: (context, state) {
                if (state is RecipeLoading) {
                  return const Center(
                      child: CircularProgressIndicator(
                          color: AppColors.splashColor));
                } else if (state is RecipeEmpty) {
                  return Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'No recipes yet!',
                          style: Theme.of(context).textTheme.displayMedium,
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Add your first recipe below.',
                          style: Theme.of(context).textTheme.displayMedium,
                        ),
                      ],
                    ),
                  );
                } else if (state is RecipeFetched) {
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: state.recipes.length,
                    itemBuilder: (context, index) {
                      final recipe = state.recipes[index];
                      return UserRecipeCard(
                        onTap: () {
                          if (recipe.docID != null) {
                            context.read<AddYourRecipeBloc>().add(
                                  FetchSingleRecipeByIDEvent(
                                      mealID: recipe.docID!),
                                );
                          }
                        },
                        onDelete: () {
                          if (recipe.docID != null) {
                            showDialog(
                              context: context,
                              builder: (BuildContext dialogContext) {
                                return AlertDialog(
                                  backgroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  title: Text("Remove ${recipe.mealName}", style: Theme.of
                                    (context).textTheme.displaySmall),
                                  content: Text(
                                      "Do you want to remove this meal ?",
                                      style: Theme.of(context).textTheme.bodyLarge),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                          content: Text("Meal not removed",
                                              style: Theme.of(context).textTheme.displaySmall),
                                          duration: Duration(seconds: 2),
                                        ));
                                        Navigator.of(dialogContext).pop(); // Close the dialog
                                      },
                                      child: Text(
                                          "No",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16.0
                                          )
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        context.read<AddYourRecipeBloc>().add(DeleteRecipeEvent(mealID: recipe.docID!),);
                                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                          content: Text("Meal removed",
                                              style: Theme.of(context).textTheme.displaySmall),
                                          duration: Duration(seconds: 2),
                                          backgroundColor: Colors.red,
                                        ));
                                        Navigator.of(dialogContext).pop();
                                      },
                                      child: Text(
                                          "Yes",
                                          style: TextStyle(
                                              color: Colors.red,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16.0
                                          )
                                      ),
                                    ),
                                  ],
                                );
                              },
                            );
                          }
                        },
                        name: recipe.mealName,
                        noOfIngredients: recipe.ingrediantsNo,
                        time: recipe.cookingTime,
                        child: Image.network(
                          recipe.mealImage,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return const Center(
                                child: Text('Failed to load image'));
                          },
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) return child;
                            return const Center(
                                child: CircularProgressIndicator(
                                    color: AppColors.splashColor));
                          },
                        ),
                      );
                    },
                  );
                } else if (state is RecipeFetchError) {
                  return Center(child: Text(state.message));
                }
                return const Center(
                    child: Text('Something went wrong, please try again'));
              },
            ),
          ),
        ],
      ),
    );
  }
}