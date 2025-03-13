import 'package:feastly/src/core/constants/colors.dart';
import 'package:feastly/src/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

import '../constants/strings.dart';

class RecipeCard extends StatelessWidget {
  final String imagePath;
  final String name;
  final String noOfIngredients;
  final String time;

  RecipeCard({
    required this.imagePath,
    required this.name,
    required this.noOfIngredients,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 205,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(imagePath)),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                name,
                style: AppTextStyles.styleBold25(context).copyWith(color: Colors.black),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                children: [
                  Text(
                    "$noOfIngredients $ingredients ",
                    style: AppTextStyles.styleRegular14(context).copyWith(color: greyColor),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  Text(
                    time,
                      style: AppTextStyles.styleRegular14(context),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
