import 'package:feastly/src/core/constants/colors.dart';
import 'package:flutter/material.dart';

class BriefDetailsRaw extends StatelessWidget {
  final String category;
  final String time;
  final String servings;
  const BriefDetailsRaw(
      {super.key,
      required this.category,
      required this.time,
      required this.servings});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '$category.',
          style: Theme.of(context)
              .textTheme
              .labelLarge!
              .copyWith(color: AppColors.greyColor),
        ),
        SizedBox(width: 10),
        Text(
          '$time.',
          style: Theme.of(context)
              .textTheme
              .labelLarge!
              .copyWith(color: AppColors.greyColor),
        ),
        SizedBox(width: 10),
        Text(
          '$servings.',
          style: Theme.of(context)
              .textTheme
              .labelLarge!
              .copyWith(color: AppColors.greyColor),
        ),
      ],
    );
  }
}
