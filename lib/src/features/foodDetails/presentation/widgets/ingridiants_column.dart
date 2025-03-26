import 'package:feastly/src/core/constants/colors.dart';
import 'package:feastly/src/core/utils/size_config.dart';
import 'package:feastly/src/features/ai_chat/data/models/ai_result_model/ai_result_model.dart';
import 'package:flutter/material.dart';

class IngridiantsColoumn extends StatelessWidget {
  final Key widgetKey;
  final AiResultModel meal;

  const IngridiantsColoumn({
    super.key,
    required this.widgetKey,
    required this.meal,
  });

  @override
  Widget build(BuildContext context) {
    for (int i = 0; i < meal.ingredients.length; i++) {
      if (meal.ingredients[i].name.contains("("))  {
        meal.ingredients[i].name = meal.ingredients[i].name
            .substring(0, meal.ingredients[i].name.indexOf("("));
      }
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(
            left: SizeConfig.height * 0.012,
          ),
          child: Text(
            key: widgetKey,
            'Total Ingredients ${meal.noOfIngredients}',
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
                      meal.ingredients[index].name,
                      style: Theme.of(context)
                          .textTheme
                          .labelLarge!
                          .copyWith(color: AppColors.splashColor),
                    ),
                  ],
                ),
                trailing: Text(meal.measures[index],
                trailing: Text(meal.ingredients[index].quantity,
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge!
                        .copyWith(color: AppColors.splashColor)),
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
