import 'package:feastly/src/core/utils/size_config.dart';
import 'package:feastly/src/features/favourite/presentation/widgets/favourite_meal_card.dart';
import 'package:flutter/material.dart';

class FavouriteScreenBody extends StatelessWidget {
  const FavouriteScreenBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.symmetric(
        horizontal: SizeConfig.width * 0.03,
        vertical: SizeConfig.height * 0.03,
      ),
      itemCount: 10,
      itemBuilder: (context, index) {
        return FavouriteMealCard();
      },
    );
  }
}
