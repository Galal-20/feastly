import 'package:feastly/src/core/constants/colors.dart';
import 'package:flutter/material.dart';

class CustomRoundedField extends StatelessWidget {
  final String label;
  final void Function(String)? onChanged;
  final TextEditingController? controller;

  const CustomRoundedField({
    super.key,
    required this.label,
    this.onChanged, this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 48,
      decoration: BoxDecoration(
        color: AppColors.tWhite,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.grey[400]!,
        ),
      ),
      child: Center(
        child: TextFormField(
          controller:controller ,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "Enter value";
            }
            return null;
          },
          decoration: InputDecoration(
            hintText: label,
            border: InputBorder.none,
            contentPadding: const EdgeInsets.symmetric(horizontal: 16),
          ),
          onChanged: onChanged,
        ),
      ),
    );
  }
}
