import 'package:feastly/src/core/constants/strings.dart';
import 'package:feastly/src/features/home/presentation/widgets/add_your_meal_widgets/custom_rounded_field.dart';
import 'package:flutter/material.dart';

class NutrationFields extends StatelessWidget {
  const NutrationFields({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CustomRoundedField(label: protine),
            CustomRoundedField(label: carb),
            CustomRoundedField(label: fats)
          ],
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CustomRoundedField(label: kcal),
            CustomRoundedField(label: vitamines),
          ],
        ),
      ],
    );
  }
}