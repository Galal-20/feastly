import 'package:feastly/src/core/constants/colors.dart';
import 'package:feastly/src/core/utils/size_config.dart';
import 'package:feastly/src/features/foodDetails/presentation/widgets/nutrition_widget.dart';
import 'package:flutter/material.dart';

class NutritionsColumn extends StatelessWidget {
  const NutritionsColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: SizeConfig.height * 0.012),
          child: Text(
            'Nutritions',
            style: Theme.of(context)
                .textTheme
                .displayMedium!
                .copyWith(color: AppColors.splashColor,fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(height: SizeConfig.height * 0.01),
        Row(
          spacing: SizeConfig.height * 0.02,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            NutritionWidget(
              num: 200,
              unit: 'kcal',
            ),
            NutritionWidget(
              num: 50,
              unit: 'protien',
            ),
            NutritionWidget(
              num: 20,
              unit: 'carb',
            ),
          ],
        ),
        SizedBox(height: SizeConfig.height * 0.01),
        Padding(
          padding: const EdgeInsets.only(left: 25),
          child: Row(
            spacing: 50,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              NutritionWidget(
                num: 10,
                unit: 'fat',
              ),
              NutritionWidget(
                num: 5,
                unit: 'sugar',
              ),
            ],
          ),
        ),
      ],
    );
  }
}
