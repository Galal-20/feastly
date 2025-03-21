import 'package:feastly/src/core/components/recipe_card.dart';
import 'package:feastly/src/core/constants/colors.dart';
import 'package:feastly/src/features/home/presentation/bloc/add_your_recipe_bloc/add_your_recipe_bloc.dart';
import 'package:feastly/src/features/home/presentation/bloc/add_your_recipe_bloc/add_your_recipe_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
            child: BlocBuilder<AddYourRecipeBloc, AddYourRecipeState>(
              builder: (context, state) {
                if (state is RecipeLoading) {
                  return const Center(
                      child: CircularProgressIndicator(
                          color: AppColors.splashColor));
                } else if (state is RecipeEmpty) {
                  return  Center(
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
                      return RecipeCard(
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
                return const SizedBox.shrink();
              },
            ),
          ),
        ],
      ),
    );
  }
}