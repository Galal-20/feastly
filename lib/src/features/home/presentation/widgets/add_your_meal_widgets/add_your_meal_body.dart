import 'package:feastly/src/core/constants/strings.dart';
import 'package:feastly/src/core/utils/app_text_styles.dart';
import 'package:feastly/src/features/home/presentation/widgets/add_your_meal_widgets/add_your_meal_fields.dart';
import 'package:feastly/src/features/home/presentation/widgets/add_your_meal_widgets/custom_add_meal_button.dart';
import 'package:feastly/src/features/home/presentation/widgets/add_your_meal_widgets/custom_meal_image.dart';
import 'package:feastly/src/features/home/presentation/widgets/add_your_meal_widgets/ingrediants_fields.dart';
import 'package:feastly/src/features/home/presentation/widgets/add_your_meal_widgets/nutration_fields.dart';
import 'package:feastly/src/features/home/presentation/widgets/add_your_meal_widgets/steps_fields.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/constants/colors.dart';

class AddYourMealBody extends StatelessWidget {
  AddYourMealBody({super.key});
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: ListView(
        children: [
          const Center(child: CustomMealImage()),
          const SizedBox(height: 20),
          AddYourMealFields(),
          Text(AppStrings.nutrition, style: Theme.of(context).textTheme.displayLarge!.copyWith(
              color: AppColors.splashColor
          )),
          const SizedBox(height: 16),
          NutrationFields(),
          const SizedBox(height: 20),
          Text(AppStrings.ingredients, style: Theme.of(context).textTheme.displayLarge!.copyWith(
              color: AppColors.splashColor
          )),
          const SizedBox(height: 20),
          IngredientsFields(),
          const SizedBox(height: 20),
          StepsFields(),
          const SizedBox(height: 20),
          CustomAddMealButton(
            onPressed: () {
              if (formKey.currentState!.validate()) {
                context.pop();
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                      content: Text('Please fill all required fields')),
                );
              }
            },
          )
        ],
      ),
    );
  }
}
