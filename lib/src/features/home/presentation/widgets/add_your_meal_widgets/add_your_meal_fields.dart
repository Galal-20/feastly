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
          labelText: mealType,
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
        ),
        const SizedBox(height: 20),
        TextFieldClass.buildTextFormField(
          labelText: mealName,
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
        ),
        const SizedBox(height: 20),
        TextFieldClass.buildTextFormField(
          labelText: noOfIngredients,
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
        ),
        const SizedBox(height: 20),
        TextFieldClass.buildTextFormField(
          labelText: time,
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
        ),
        const SizedBox(height: 20),
        TextFieldClass.buildTextFormField(
          labelText: summary,
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
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
