import 'package:feastly/src/core/app_router/app_routes.dart';
import 'package:feastly/src/core/utils/size_config.dart';
import 'package:feastly/src/features/favourite/presentation/bloc/favorite_bloc.dart';
import 'package:feastly/src/features/favourite/presentation/widgets/favourite_meal_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class FavouriteScreenBody extends StatelessWidget {
  const FavouriteScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteBloc, FavoriteState>(
      builder: (context, state) {
        if (state is FavoriteLoaded) {
          if (state.favRecipes.isEmpty) {
            return Center(
              child: Text("No Favourite Recipes",
                  style: Theme.of(context)
                      .textTheme
                      .displayLarge
                      ?.copyWith(color: Colors.black)),
            );
          }
          return ListView.builder(
            padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.width * 0.03,
              vertical: SizeConfig.height * 0.03,
            ),
            itemCount: state.favRecipes.length,
            itemBuilder: (context, index) {
              return InkWell(
                  onTap: () => GoRouter.of(context).push(
                        AppRoutes.kFoodDetailsScreen,
                        extra: {
                          'meal': state.favRecipes[index],
                          'isFav': true,
                          'isFromHome': false
                        },
                        
                      ),
                  child: FavouriteMealCard(recipe: state.favRecipes[index],));
            },
          );
        }
        return Center(
          child: Text("No Favourite Recipes",
              style: Theme.of(context)
                  .textTheme
                  .displayLarge
                  ?.copyWith(color: Colors.black)),
        );
      },
    );
  }
}
