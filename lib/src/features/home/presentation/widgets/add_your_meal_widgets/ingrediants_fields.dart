import 'package:feastly/src/core/constants/strings.dart';
import 'package:feastly/src/features/home/presentation/widgets/add_your_meal_widgets/custom_rounded_field.dart';
import 'package:flutter/material.dart';

class IngredientsFields extends StatelessWidget {
  const IngredientsFields({
    super.key,
    required this.ingrediant1Controller,
    required this.piece1Controller,
    required this.ingrediant2Controller,
    required this.piece2Controller,
    required this.ingrediant3Controller,
    required this.piece3Controller,
    required this.ingrediant4Controller,
    required this.piece4Controller,
  });
  final TextEditingController ingrediant1Controller;
  final TextEditingController piece1Controller;
  final TextEditingController ingrediant2Controller;
  final TextEditingController piece2Controller;
  final TextEditingController ingrediant3Controller;
  final TextEditingController piece3Controller;
  final TextEditingController ingrediant4Controller;
  final TextEditingController piece4Controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          CustomRoundedField(
              label: AppStrings.ingredients, controller: ingrediant1Controller),
          CustomRoundedField(
              label: AppStrings.pieces, controller: piece1Controller),
        ]),
        const SizedBox(height: 16),
        Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          CustomRoundedField(
              label: AppStrings.ingredients, controller: ingrediant2Controller),
          CustomRoundedField(
              label: AppStrings.pieces, controller: piece2Controller),
        ]),
        const SizedBox(height: 16),
        Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          CustomRoundedField(
              label: AppStrings.ingredients, controller: ingrediant3Controller),
          CustomRoundedField(
              label: AppStrings.pieces, controller: piece3Controller),
        ]),
        const SizedBox(height: 16),
        Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          CustomRoundedField(
              label: AppStrings.ingredients, controller: ingrediant4Controller),
          CustomRoundedField(
              label: AppStrings.pieces, controller: piece4Controller),
          CustomRoundedField(label: AppStrings.ingredients),
          CustomRoundedField(label: AppStrings.pieces),
        ]),
      ],
    );
  }
}
