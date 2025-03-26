import 'package:feastly/assets.dart';
import 'package:feastly/src/core/utils/size_config.dart';
import 'package:feastly/src/features/favourite/presentation/widgets/favourite_meal_details.dart';
import 'package:flutter/material.dart';

class FavouriteMealCard extends StatelessWidget {
  const FavouriteMealCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: SizeConfig.height * 0.01,
      ),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(SizeConfig.width * 0.02),
          side: BorderSide(color: Colors.grey.shade400),
        ),
        elevation: 1.0,
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.only(
            left: SizeConfig.width * 0.04,
            top: SizeConfig.height * 0.015,
            bottom: SizeConfig.height * 0.015,
          ),
          child: Row(
            children: [
              CircleAvatar(
                radius: SizeConfig.width * 0.12,
                backgroundImage: AssetImage(Assets.AssetsImagesDish1),
              ),
              SizedBox(
                width: SizeConfig.width * 0.03,
              ),
              FavouriteMealDetails()
            ],
          ),
        ),
      ),
    );
  }
}

