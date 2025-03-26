import 'package:feastly/src/core/constants/colors.dart';
import 'package:feastly/src/core/utils/size_config.dart';
import 'package:feastly/src/features/foodDetails/domain/entities/meal_entity.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


class FoodDetailsAppBar extends StatelessWidget {
  final MealEntity meal;
  const FoodDetailsAppBar({super.key, required this.meal});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      actions: [
        Icon(
          Icons.favorite_rounded,
          color: Colors.red,
          size: 40,
        )
      ],
      //actionsPadding: EdgeInsets.all(10),
      backgroundColor: Colors.white,
      leading: IconButton(
        icon: Icon(Icons.arrow_back_ios),
        onPressed: () {
          context.pop();
        },
      ),
      expandedHeight: SizeConfig.height * 0.48,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: EdgeInsets.only(
            left: SizeConfig.height * 0.03,
            bottom: SizeConfig.height * 0.016,
            right: SizeConfig.height * 0.1
        ),
        title: Text(
         meal.strMeal,
          // textAlign: TextAlign.left,
          style: Theme.of(context)
              .textTheme
              .displayLarge!
              .copyWith(color: AppColors.splashColor),
        ),
        background: Image.network(
          meal.strMealThumb ?? "https://images.pexels.com/photos/3184183/pexels-photo-3184183.jpeg",
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
