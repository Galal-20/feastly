import 'package:feastly/src/core/constants/colors.dart';
import 'package:feastly/src/core/utils/size_config.dart';
import 'package:feastly/src/features/ai_chat/data/models/ai_result_model/ai_result_model.dart';
import 'package:feastly/src/features/foodDetails/presentation/meal_details_bloc/meal_details_bloc.dart';
import 'package:feastly/src/features/foodDetails/presentation/meal_details_bloc/meal_details_event.dart';
import 'package:feastly/src/features/foodDetails/presentation/meal_details_bloc/meal_details_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class FoodDetailsAppBar extends StatelessWidget {
  AiResultModel meal;
  bool? isFave;
  bool? isFromHome;
  FoodDetailsAppBar(
      {super.key, required this.meal, this.isFave, this.isFromHome});

  @override
  Widget build(BuildContext context) {
    if (isFave != null) {
      context.read<MealDetailsBloc>().isFave = isFave!;
    }
    return SliverAppBar(
      actions: [
        BlocBuilder<MealDetailsBloc, MealDetailsState>(
          builder: (context, state) {
            return IconButton(
                icon: Icon(
                  Icons.favorite_rounded,
                  color: context.read<MealDetailsBloc>().isFave
                      ? Colors.red
                      : Colors.grey,
                  size: 40,
                ),
                disabledColor: Colors.grey,
                onPressed: () {
                  if (isFromHome == true) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(
                        "It's already in your Meals List",
                          style: Theme.of(context).textTheme.displaySmall),
                      duration: Duration(seconds: 2),
                    ));
                  } else {
                    if (context.read<MealDetailsBloc>().isFave) {
                      showDialog(
                        context: context,
                        builder: (BuildContext dialogContext) {
                          return AlertDialog(
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            title: Text("Remove Favorite", style: Theme.of(context).textTheme.displaySmall),
                            content: Text(
                                "Do you want to remove this meal from favorites?",
                                style: Theme.of(context).textTheme.bodyLarge),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                    content: Text("Meal not removed from Favorites",
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
                                  context.read<MealDetailsBloc>().add(RemoveFavoriteRecipe(meal));
                                  context.read<MealDetailsBloc>().add(ToggleFavIcon());
                                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                    content: Text("Meal removed from Favorites",
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
                    } else {
                      context.read<MealDetailsBloc>().add(AddFavoriteRecipe(meal));
                      context.read<MealDetailsBloc>().add(ToggleFavIcon());

                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text("Meal added to Favorites",
                            style: Theme.of(context).textTheme.displaySmall),
                        duration: Duration(seconds: 2),
                        backgroundColor: Colors.green,
                      ));
                    }
                  }
                    /*if (context.read<MealDetailsBloc>().isFave) {
                      context
                          .read<MealDetailsBloc>()
                          .add(RemoveFavoriteRecipe(meal));
                    } else {
                      context
                          .read<MealDetailsBloc>()
                          .add(AddFavoriteRecipe(meal));
                    }
                    context.read<MealDetailsBloc>().add(ToggleFavIcon());
                  }*/
                });
          },
        ),
      ],
      //actionsPadding: EdgeInsets.all(10),
      backgroundColor: Colors.white,
      leading: IconButton(
        icon: Icon(Icons.arrow_back_ios),
        onPressed: () {
          context.pop();
        },
      ),
      expandedHeight: SizeConfig.height * 0.3,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: EdgeInsets.only(
            left: SizeConfig.height * 0.04, bottom: SizeConfig.height * 0.016),
        title: Text(
          meal.foodTitle,
          // textAlign: TextAlign.left,
          style: Theme.of(context).textTheme.displayLarge!.copyWith(
                color: AppColors.splashColor,
                fontWeight: FontWeight.bold,
              ),
        ),
        background: Stack(
          fit: StackFit.expand,
          children: [
            Image.network(
                // placeHolderImage,
                meal.imageNetworkUrl,
                fit: BoxFit.cover, errorBuilder: (context, error, stackTrace) {
              return Image.asset(
                "assets/images/dish1.png", // Your local placeholder image
                fit: BoxFit.cover,
              );
            }),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.white.withValues(alpha: 0.6),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
