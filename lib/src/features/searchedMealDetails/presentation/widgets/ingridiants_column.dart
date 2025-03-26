import 'package:feastly/src/core/constants/colors.dart';
import 'package:feastly/src/core/utils/size_config.dart';
import 'package:feastly/src/features/searchedMealDetails/domain/entities/meal_entity.dart';
import 'package:flutter/material.dart';

class IngridiantsColoumn extends StatelessWidget {
  final Key widgetKey;
  final MealEntity meal;

  const IngridiantsColoumn({
    super.key,
    required this.widgetKey, required this.meal,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(
            left: SizeConfig.height * 0.012,
          ),
          child: Text(
            key: widgetKey,
            'Total Ingredients ${meal.ingredients.length}',
            style: Theme.of(context).textTheme.displayMedium!.copyWith(
                color: AppColors.splashColor, fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: SizeConfig.height * 0.02,
            right: SizeConfig.height * 0.02,
          ),
          child: ListView.separated(
            padding: EdgeInsets.all(4),
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: meal.ingredients.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: AppColors.greyColor,
                    ),
                    SizedBox(width: 10),
                    Text(
                      meal.ingredients[index],
                      style: Theme.of(context)
                          .textTheme
                          .labelLarge!
                          .copyWith(color: AppColors.splashColor),
                    ),
                  ],
                ),
                trailing: Text(
                  index < meal.measures.length ? meal.measures[index] : '',
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge!
                      .copyWith(color: AppColors.splashColor),
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return Container(
                margin: EdgeInsets.fromLTRB(
                    SizeConfig.height * 0.015, 0, SizeConfig.height * 0.015, 0),
                height: 1,
                color: AppColors.splashColor,
              );
            },
          ),
        ),
      ],
    );
  }
}
