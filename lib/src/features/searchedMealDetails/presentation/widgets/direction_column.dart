import 'package:feastly/src/core/constants/colors.dart';
import 'package:feastly/src/core/utils/size_config.dart';
import 'package:feastly/src/features/searchedMealDetails/domain/entities/meal_entity.dart';
import 'package:flutter/material.dart';

class DirectionColumn extends StatelessWidget {
  final Key widgetKey;
  final MealEntity meal;

  const DirectionColumn({
    super.key,
    required this.widgetKey,
    required this.meal,
  });

  @override
  Widget build(BuildContext context) {
    List<String>? steps = meal.strInstructions?.split(RegExp(r'\.\s+|\n'));

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: SizeConfig.height * 0.012),
          child: Text(
            key: widgetKey,
            'Total Steps: ${steps?.length}',
            style: Theme.of(context)
                .textTheme
                .displayMedium!
                .copyWith(color: AppColors.splashColor, fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: SizeConfig.height * 0.02),
          child: ListView.separated(
            padding: EdgeInsets.all(4),
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: steps!.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(
                  'Step ${index + 1}',
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge!
                      .copyWith(color: AppColors.splashColor, fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  steps[index].trim(),
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge!
                      .copyWith(color: AppColors.splashColor),
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return Container(
                margin: EdgeInsets.symmetric(horizontal: SizeConfig.height * 0.015),
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
