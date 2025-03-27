import 'package:feastly/src/core/constants/colors.dart';
import 'package:flutter/material.dart';
import '../constants/strings.dart';

class RecipeCard extends StatelessWidget {
  final String name;
  final String noOfIngredients;
  final String time;
  final Widget child;
  final Function()? onTap;

  const RecipeCard({
    super.key,
    required this.name,
    required this.noOfIngredients,
    required this.time,
    required this.child, this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
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
                child: SizedBox(
                  height: 90,
                  width: double.infinity,
                  child: child,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: Theme.of(context).textTheme.displayMedium,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    Row(
                      children: [
                        Text(
                          "$noOfIngredients ${AppStrings.ingredients} ",
                          style: Theme.of(context).textTheme.bodyLarge,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                        Text(
                          "$time ${AppStrings.minutes} ",
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(color: AppColors.splashColor),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
