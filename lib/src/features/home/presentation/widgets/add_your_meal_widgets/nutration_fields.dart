import 'package:feastly/src/core/constants/strings.dart';
import 'package:feastly/src/features/home/presentation/widgets/add_your_meal_widgets/custom_rounded_field.dart';
import 'package:flutter/material.dart';

class NutrationFields extends StatelessWidget {
  const NutrationFields({
    super.key,
    required this.protineController,
    required this.carbController,
    required this.fatsController,
    required this.kcalController,
    required this.vitaminsController,
  });
  final TextEditingController protineController;
  final TextEditingController carbController;
  final TextEditingController fatsController;
  final TextEditingController kcalController;
  final TextEditingController vitaminsController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CustomRoundedField(
                label: AppStrings.protein, controller: protineController),
            CustomRoundedField(
                label: AppStrings.carb, controller: carbController),
            CustomRoundedField(
                label: AppStrings.fats, controller: fatsController)
          ],
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CustomRoundedField(
                label: AppStrings.kcal, controller: kcalController),
            CustomRoundedField(
                label: AppStrings.vitamins, controller: vitaminsController),
          ],
        ),
      ],
    );
  }
}