import 'package:feastly/src/core/constants/strings.dart';
import 'package:feastly/src/features/home/presentation/widgets/add_your_meal_widgets/custom_rounded_field.dart';
import 'package:flutter/material.dart';

class IngredientsFields extends StatelessWidget {
  const IngredientsFields({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          CustomRoundedField(label: AppStrings.ingredients),
          CustomRoundedField(label: AppStrings.pieces),
        ]),
        const SizedBox(height: 16),
        Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          CustomRoundedField(label: AppStrings.ingredients),
          CustomRoundedField(label: AppStrings.pieces),
        ]),
        const SizedBox(height: 16),
        Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          CustomRoundedField(label: AppStrings.ingredients),
          CustomRoundedField(label: AppStrings.pieces),
        ]),
        const SizedBox(height: 16),
        Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          CustomRoundedField(label: AppStrings.ingredients),
          CustomRoundedField(label: AppStrings.pieces),
        ]),
      ],
    );
  }
}
