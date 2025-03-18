import 'package:feastly/src/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

import '../../../../core/components/recommended_card.dart';
import '../../../../core/constants/strings.dart';

class RecommendedForYouWidget extends StatelessWidget {
  const RecommendedForYouWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppStrings.recommendedMeal,
            style: Theme.of(context).textTheme.displaySmall,
          ),
          SizedBox(height: 10),
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: 5,
            itemBuilder: (context, index) {
              return RecommendedCard(
                imagePath: 'assets/images/dish2.png',
                name: 'Burger',
                noOfIngredients: '10',
                time: '14min',
              );
            },
          ),
        ],
      ),
    );
  }
}
