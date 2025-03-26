import 'package:feastly/src/core/utils/size_config.dart';
import 'package:feastly/src/features/ai_chat/data/models/ai_result_model/ai_result_model.dart';
import 'package:feastly/src/features/favourite/presentation/bloc/favorite_bloc.dart';
import 'package:feastly/src/features/favourite/presentation/widgets/star_rating.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavouriteMealDetails extends StatelessWidget {
final AiResultModel recipe;
  const FavouriteMealDetails({
    super.key, required this.recipe,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: SizeConfig.width * 0.6,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                recipe.typeOfMeat,
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge!
                        .copyWith(fontSize: 18),
                  ),
                  SizedBox(
                    width: SizeConfig.width * 0.45,
                    child: Text(
                recipe.foodTitle,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context)
                          .textTheme
                          .displayLarge!
                          .copyWith(fontSize: 26, fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
              IconButton(
                icon: Icon(
                  Icons.favorite,
                  color: Colors.red,
                  
                ),
                style: IconButton.styleFrom(
                  padding: EdgeInsets.all(0),
                  iconSize: SizeConfig.width * 0.08,
                ),
                onPressed: () {

                  context.read<FavoriteBloc>().add(
                      RemoveFavoriteRecipe(recipe));
                },
              )
            ],
          ),
          Row(
            children: [
              Text(
                '${recipe.noOfIngredients.toString()} Ingredients',
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .copyWith(fontSize: 16),
              ),
              SizedBox(
                width: SizeConfig.width * 0.025,
              ),
              Text(
                '${recipe.time.toString()} min',
                style: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .copyWith(fontSize: 16,fontWeight: FontWeight.w500),
              ),
            ],
          ),
          StarRating(rating: 3.5)
        ],
      ),
    );
  }
}
