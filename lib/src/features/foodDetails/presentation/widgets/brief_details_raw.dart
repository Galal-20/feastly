import 'package:feastly/src/core/constants/colors.dart';
import 'package:feastly/src/core/utils/size_config.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BriefDetailsRaw extends StatelessWidget {
   String category;
  final String time;
  final String servings;
   BriefDetailsRaw(
      {super.key,
      required this.category,
      required this.time,
      required this.servings});

  @override
  Widget build(BuildContext context) {
    if  (category.contains("("))  {
      category = category.substring(0, category.indexOf("("));
    }
   
    return Padding(
      padding: EdgeInsets.all(SizeConfig.height * 0.008),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '$category .',
            style: Theme.of(context)
                .textTheme
                .labelLarge!
                .copyWith(color: AppColors.greyColor),
          ),
          SizedBox(width: SizeConfig.height * 0.003),
          Text(
            ' $time Min .',
            style: Theme.of(context)
                .textTheme
                .labelLarge!
                .copyWith(color: AppColors.greyColor),
          ),
          SizedBox(width: SizeConfig.height * 0.003),
          Text(
            ' $servings Serving',
            style: Theme.of(context)
                .textTheme
                .labelLarge!
                .copyWith(color: AppColors.greyColor),
          ),
        ],
      ),
    );
  }
}
