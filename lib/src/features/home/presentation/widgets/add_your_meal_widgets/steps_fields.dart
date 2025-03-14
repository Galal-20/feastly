import 'package:feastly/src/core/components/text_form_field.dart';
import 'package:feastly/src/core/constants/strings.dart';
import 'package:flutter/material.dart';

class StepsFields extends StatelessWidget {
  const StepsFields({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFieldClass.buildTextFormField(
          step1,
          'e.g. Mix egg and flour.......',
          (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter first step';
            }
            return null;
          },
          (value) {
            debugPrint('Summary entered: $value');
          },
          const Icon(Icons.description),
          maxLines: 2,
        ),
        const SizedBox(height: 20),
        TextFieldClass.buildTextFormField(
          step2,
          'e.g. Add 2 cups of water...',
          (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter second step';
            }
            return null;
          },
          (value) {
            debugPrint('Summary entered: $value');
          },
          const Icon(Icons.description),
          maxLines: 2,
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}