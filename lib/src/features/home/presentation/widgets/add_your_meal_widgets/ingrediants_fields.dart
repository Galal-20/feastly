import 'package:feastly/src/core/constants/strings.dart';
import 'package:feastly/src/features/home/presentation/widgets/add_your_meal_widgets/custom_rounded_field.dart';
import 'package:flutter/material.dart';

class IngrediantsFields extends StatelessWidget {
  const IngrediantsFields({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          CustomRoundedField(label: ingrediants),
          CustomRoundedField(label: pices),
        ]),
        const SizedBox(height: 16),
        Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          CustomRoundedField(label: ingrediants),
          CustomRoundedField(label: pices),
        ]),
        const SizedBox(height: 16),
        Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          CustomRoundedField(label: ingrediants),
          CustomRoundedField(label: pices),
        ]),
        const SizedBox(height: 16),
        Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          CustomRoundedField(label: ingrediants),
          CustomRoundedField(label:pices),
        ]),
      ],
    );
  }
}