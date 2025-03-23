import 'package:feastly/src/core/components/text_form_field.dart';
import 'package:feastly/src/core/constants/strings.dart';
import 'package:flutter/material.dart';

class StepsFields extends StatelessWidget {
  const StepsFields({
    super.key,
    required this.step1Controller,
    required this.step2Controller,
  });
  final TextEditingController step1Controller;
  final TextEditingController step2Controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFieldClass.buildTextFormField(
          labelText: AppStrings.step1,
          hintText: 'e.g. Mix egg and flour.......',
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter first step';
            }
            return null;
          },
          onChanged: (value) {
            debugPrint('Summary entered: $value');
          },
          prefixIcon: const Icon(Icons.description),
          maxLines: 2,
          controller: step1Controller,
        ),
        const SizedBox(height: 20),
        TextFieldClass.buildTextFormField(
          labelText: AppStrings.step2,
          hintText: 'e.g. Add 2 cups of water...',
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter second step';
            }
            return null;
          },
          onChanged: (value) {
            debugPrint('Summary entered: $value');
          },
          prefixIcon: const Icon(Icons.description),
          maxLines: 2,
          controller: step2Controller,
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
