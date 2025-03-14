import 'package:feastly/src/core/components/text_form_field.dart';
import 'package:feastly/src/core/constants/strings.dart';
import 'package:flutter/material.dart';

class AddYourMealFields extends StatelessWidget {
  const AddYourMealFields({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFieldClass.buildTextFormField(
          mealType,
          'e.g. Breakfast, Lunch, Dinner',
          (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter a meal type';
            }
            return null;
          },
          (value) {
            debugPrint(value);
          },
          const Icon(Icons.fastfood),
        ),
        const SizedBox(height: 20),
        TextFieldClass.buildTextFormField(
          mealName,
          'e.g. Chicken Salad',
          (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter a meal name';
            }
            return null;
          },
          (value) {
            debugPrint(value);
          },
          const Icon(Icons.restaurant_menu),
        ),
        const SizedBox(height: 20),
        TextFieldClass.buildTextFormField(
          noOfIngredients,
          'e.g. 5',
          (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter the number of ingredients';
            }
            if (int.tryParse(value) == null || int.parse(value) <= 0) {
              return 'Please enter a valid positive number';
            }
            return null;
          },
          (value) {
            debugPrint(value);
          },
          const Icon(Icons.format_list_numbered),
        ),
        const SizedBox(height: 20),
        TextFieldClass.buildTextFormField(
          time,
          'e.g. 30',
          (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter the preparation time';
            }
            if (int.tryParse(value) == null || int.parse(value) <= 0) {
              return 'Please enter a valid positive number';
            }
            return null;
          },
          (value) {
            debugPrint(value);
          },
          const Icon(Icons.timer),
        ),
        const SizedBox(height: 20),
        TextFieldClass.buildTextFormField(
          summary,
          'e.g. A delicious salad with fresh ingredients...',
          (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter a summary';
            }
            return null;
          },
          (value) {
            debugPrint(value);
          },
          const Icon(Icons.description),
          maxLines: 2,
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}