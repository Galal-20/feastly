import 'package:feastly/src/core/constants/colors.dart';
import 'package:feastly/src/features/foodDetails/presentation/widgets/dymmy.dart';
import 'package:flutter/material.dart';

class FoodDetailsSummary extends StatelessWidget {
  final Key summaryKey;

  const FoodDetailsSummary({super.key, required this.summaryKey});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Text(
          key: summaryKey,
          style: Theme.of(context)
              .textTheme
              .titleSmall!
              .copyWith(color: AppColors.splashColor),
          dummydata['strInstructions']),
    );
  }
}
