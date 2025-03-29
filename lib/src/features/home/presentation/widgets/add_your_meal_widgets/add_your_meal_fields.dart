import 'package:feastly/src/core/components/text_form_field.dart';
import 'package:feastly/src/core/constants/strings.dart';
import 'package:flutter/material.dart';

class AddYourMealFields extends StatelessWidget {
  const AddYourMealFields({
    super.key,
    required this.mealTypeController,
    required this.mealNameController,
    required this.mealTimeController,
    required this.mealIngrediantsController,
    required this.mealSummaryController,
  });
  final TextEditingController mealTypeController;
  final TextEditingController mealNameController;
  final TextEditingController mealTimeController;
  final TextEditingController mealIngrediantsController;
  final TextEditingController mealSummaryController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFieldClass.buildTextFormField(
          labelText: AppStrings.mealType,
          hintText: 'e.g. Breakfast, Lunch, Dinner',
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter a meal type';
            }
            return null;
          },
          onChanged: (value) {
            debugPrint(value);
          },
          prefixIcon: const Icon(Icons.fastfood),
          controller: mealTypeController,
        ),
        const SizedBox(height: 20),
        TextFieldClass.buildTextFormField(
          labelText: AppStrings.mealName,
          hintText: 'e.g. Chicken Salad',
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter a meal name';
            }
            return null;
          },
          onChanged: (value) {
            debugPrint(value);
          },
          prefixIcon: const Icon(Icons.restaurant_menu),
          controller: mealNameController,
        ),
        const SizedBox(height: 20),
        TextFieldClass.buildTextFormField(
          labelText: AppStrings.noOfIngredients,
          hintText: 'e.g. 5',
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter the number of ingredients';
            }
            if (int.tryParse(value) == null || int.parse(value) <= 0) {
              return 'Please enter a valid positive number';
            }
            return null;
          },
          onChanged: (value) {
            debugPrint(value);
          },
          prefixIcon: const Icon(Icons.format_list_numbered),
          controller: mealIngrediantsController,
        ),
        const SizedBox(height: 20),
        TextFieldClass.buildTextFormField(
          labelText: AppStrings.time,
          hintText: 'e.g. 30',
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter the preparation time';
            }
            if (int.tryParse(value) == null || int.parse(value) <= 0) {
              return 'Please enter a valid positive number';
            }
            return null;
          },
          onChanged: (value) {
            debugPrint(value);
          },
          prefixIcon: const Icon(Icons.timer),
          controller: mealTimeController,
        ),
        const SizedBox(height: 20),
        TextFieldClass.buildTextFormField(
          labelText: AppStrings.summary,
          hintText: 'e.g. A delicious salad with fresh ingredients...',
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter a summary';
            }
            return null;
          },
          onChanged: (value) {
            debugPrint(value);
          },
          prefixIcon: const Icon(Icons.description),
          maxLines: 2,
          controller: mealSummaryController,
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}

