import 'package:feastly/src/core/constants/colors.dart';
import 'package:feastly/src/core/utils/size_config.dart';
import 'package:feastly/src/features/foodDetails/presentation/widgets/dymmy.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FoodDetailsAppBar extends StatelessWidget {
  const FoodDetailsAppBar({super.key});

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
      actionsPadding: EdgeInsets.all(10),
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
          dummydata['strMeal'],
          // textAlign: TextAlign.left,
          style: Theme.of(context)
              .textTheme
              .displayLarge!
              .copyWith(color: AppColors.splashColor),
        ),
        background: Image.network(
          dummydata['strMealThumb'],
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
