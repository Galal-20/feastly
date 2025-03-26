import 'package:feastly/src/core/constants/colors.dart';
import 'package:feastly/src/core/utils/size_config.dart';
import 'package:feastly/src/features/ai_chat/data/models/ai_result_model/ai_result_model.dart';
import 'package:flutter/material.dart';

import '../../domain/entities/meal_entity.dart';

class DirectionColumn extends StatelessWidget {
  final Key widgetKey;
  final MealEntity meal; // Add MealEntity as a required parameter

  const DirectionColumn({
    super.key,
    required this.widgetKey,
    required this.meal, // Initialize it in the constructor
  });
  final AiResultModel meal;
  const DirectionColumn(
      {super.key, required this.widgetKey, required this.meal});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: SizeConfig.height * 0.012),
          child: Text(
            key: widgetKey,
            'Total steps',
            style: Theme.of(context)
                .textTheme
                .displayMedium!
                .copyWith(color: AppColors.splashColor, fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(SizeConfig.height * 0.02, 0, SizeConfig.height * 0.02, 0),
            'Total steps ${meal.directions.length}',
            style: Theme.of(context).textTheme.displayMedium!.copyWith(
                color: AppColors.splashColor, fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(
              SizeConfig.height * 0.02, 0, SizeConfig.height * 0.02, 0),
          child: ListView.separated(
            padding: EdgeInsets.all(4),
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 1,
            itemBuilder: (context, index) {
              return ListTile(
                subtitle: Text(
                  meal.strInstructions ?? '',
            itemCount: meal.directions.length ,
            itemBuilder: (context, index) {
              return ListTile(
                subtitle: Text(
                  meal.directions[index],
                ),
                subtitleTextStyle: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .copyWith(color: AppColors.splashColor),
                title: Text(
                  'Step ${index + 1}',
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge!
                      .copyWith(color: AppColors.splashColor),
                ),
               /* title: Text(
                  '',
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge!
                      .copyWith(color: AppColors.splashColor),
                ),*/
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