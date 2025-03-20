import 'package:feastly/src/core/constants/colors.dart';
import 'package:feastly/src/core/constants/strings.dart';
import 'package:feastly/src/features/home/presentation/widgets/add_your_meal_widgets/add_your_meal_body.dart';
import 'package:flutter/material.dart';

class AddYourRecipeScreen extends StatelessWidget {
  const AddYourRecipeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppColors.splashColor),
        title: Text(
          AppStrings.addYourRecipe,
          style: Theme.of(context).textTheme.displayLarge!.copyWith(
            color: AppColors.splashColor
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: AddYourMealBody(),
      ),
    );
  }
}