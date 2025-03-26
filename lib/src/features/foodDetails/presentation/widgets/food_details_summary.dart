import 'package:feastly/src/core/constants/colors.dart';
import 'package:feastly/src/features/ai_chat/data/models/ai_result_model/ai_result_model.dart';
import 'package:flutter/material.dart';

class FoodDetailsSummary extends StatelessWidget {
  final Key summaryKey;
  final AiResultModel meal;

  const FoodDetailsSummary(
      {super.key, required this.summaryKey, required this.meal});
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
          "${meal.strInstructions?.substring(0, 200)}.."
      ),
          meal.summary),
    );
  }
}
