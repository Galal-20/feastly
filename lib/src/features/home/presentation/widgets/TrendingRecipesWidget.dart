import 'package:feastly/src/features/ai_chat/presentation/widgets/custom_ai_error_widget.dart';
import 'package:feastly/src/features/home/domain/usecases/trending_recipes_section/get_trending_recipes_usecase.dart';
import 'package:feastly/src/features/home/presentation/bloc/trending_recipes_bloc/trending_recipes_bloc.dart';
import 'package:feastly/src/features/home/presentation/bloc/trending_recipes_bloc/trending_recipes_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/DI/service_locator.dart';
import '../../../../core/app_router/app_routes.dart';
import '../../../../core/components/recipe_card.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/constants/keys.dart';
import '../../../ai_chat/domain/use_case/get_image_use_case.dart';
import '../bloc/trending_recipes_bloc/trending_recipes_event.dart';

class RecipesWidget extends StatelessWidget {
  const RecipesWidget({super.key, required this.recipesType});
  final String recipesType;

  @override
  Widget build(BuildContext context) {
    Gemini.init(apiKey: googleApiKey);
    // TODO: implement build
    return BlocProvider(
        create: (context) {
          final bloc = TrendingRecipesBloc(
              sl<GetTrendingRecipesUseCase>(), sl<GetImageUseCase>());
          bloc.add(HomeTrendingRecipesEvent());
          return bloc;
        },
        child: BlocConsumer<TrendingRecipesBloc, TrendingRecipesState>(
            listener: (context, state) {
          if (state is TrendingRecipesMapped) {
            GoRouter.of(context).push(
              AppRoutes.kFoodDetailsScreen,
              extra: {'aiResultModel': state.mappedMeal},
            ).then((_) {
              context.read<TrendingRecipesBloc>().add(HomeTrendingRecipesEvent());
            });
          }
        }, builder: (context, state) {
          if (state is TrendingRecipesLoading) {
            return Center(
                child: CircularProgressIndicator(color: AppColors.splashColor));
          }
          if (state is TrendingRecipesError) {
            return CustomAiErrorWidget(errMsg: state.message);
          }
          if (state is TrendingRecipesSuccess) {
            var trendingRecipesList = state.trendingRecipesEntity.trendingMeals;
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    recipesType,
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                  SizedBox(height: 10),
                  SizedBox(
                    height: 160,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: trendingRecipesList.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            context.read<TrendingRecipesBloc>().add(
                                MapMealForDetailsEvent(
                                    meal: trendingRecipesList[index]));
                          },
                          child: RecipeCard(
                            name: trendingRecipesList[index].foodTitle,
                            noOfIngredients:
                                trendingRecipesList[index].numberOfIngredients,
                            time: trendingRecipesList[index].cookingTime,
                            child: Image.network(
                              trendingRecipesList[index].imageUrl,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return const Center(
                                    child: Text('Failed to load image'));
                              },
                              loadingBuilder:
                                  (context, child, loadingProgress) {
                                if (loadingProgress == null) return child;
                                return const Center(
                                    child: CircularProgressIndicator(
                                        color: AppColors.splashColor));
                              },
                            ),
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            );
          }
          return Placeholder();
        }));
  }
}
