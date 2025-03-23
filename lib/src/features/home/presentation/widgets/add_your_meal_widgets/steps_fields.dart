import 'package:feastly/src/core/components/text_form_field.dart';
import 'package:feastly/src/core/constants/strings.dart';
import 'package:flutter/material.dart';

class StepsFields extends StatelessWidget {
  const StepsFields({
    super.key,
    required this.stepsController,
  });
  final TextEditingController stepsController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFieldClass.buildTextFormField(
          labelText: AppStrings.steps,
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
          maxLines: 3,
          controller: stepsController,
        ),

        const SizedBox(height: 20),
      ],
    );
  }
}
