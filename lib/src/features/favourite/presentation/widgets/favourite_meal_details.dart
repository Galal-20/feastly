import 'package:feastly/src/core/utils/size_config.dart';
import 'package:feastly/src/features/favourite/presentation/widgets/star_rating.dart';
import 'package:flutter/material.dart';

class FavouriteMealDetails extends StatelessWidget {
  const FavouriteMealDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: SizeConfig.width * 0.6,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "vegan",
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge!
                        .copyWith(fontSize: 18),
                  ),
                  SizedBox(
                    width: SizeConfig.width * 0.45,
                    child: Text(
                      "Italian pizza",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context)
                          .textTheme
                          .displayLarge!
                          .copyWith(fontSize: 26, fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
              IconButton(
                icon: Icon(
                  Icons.favorite,
                ),
                style: IconButton.styleFrom(
                  padding: EdgeInsets.all(0),
                  iconSize: SizeConfig.width * 0.08,
                ),
                onPressed: () {},
              )
            ],
          ),
          Row(
            children: [
              Text(
                "12 ingredients",
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .copyWith(fontSize: 16),
              ),
              SizedBox(
                width: SizeConfig.width * 0.025,
              ),
              Text(
                "30min",
                style: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .copyWith(fontSize: 16,fontWeight: FontWeight.w500),
              ),
            ],
          ),
          StarRating(rating: 3.5)
        ],
      ),
    );
  }
}
