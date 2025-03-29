import 'package:feastly/src/core/constants/colors.dart';
import 'package:feastly/src/core/utils/size_config.dart';
import 'package:feastly/src/features/ai_chat/data/models/ai_result_model/ai_result_model.dart';
import 'package:feastly/src/features/foodDetails/presentation/widgets/nutrition_widget.dart';
import 'package:flutter/material.dart';

class NutritionsColumn extends StatelessWidget {
  final AiResultModel meal;
  const NutritionsColumn({super.key, required this.meal});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: SizeConfig.height * 0.012),
          child: Text(
            'Nutritions',
            style: Theme.of(context).textTheme.displayMedium!.copyWith(
                color: AppColors.splashColor, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(height: SizeConfig.height * 0.01),
        Row(
          spacing: SizeConfig.height * 0.02,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            NutritionWidget(
              num: meal.nutritionalInformation.kcal,
              unit: 'kcal',
            ),
            NutritionWidget(
              num: meal.nutritionalInformation.protein,
              unit: 'protien',
            ),
            NutritionWidget(
              num: meal.nutritionalInformation.carbs,
              unit: 'carb',
            ),
          ],
        ),
        SizedBox(height: SizeConfig.height * 0.01),
        Padding(
          padding:  EdgeInsets.only(left: SizeConfig.height * 0.1),
          child: Row(
            spacing: SizeConfig.height * 0.05,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              NutritionWidget(
                num: meal.nutritionalInformation.fats,
                unit: 'fat',
              ),
              NutritionWidget(
                num: meal.nutritionalInformation.vitamins.substring(0,1),
                unit: 'vitamin',
              ),
            ],
          ),
        ),
      ],
    );
  }
}
