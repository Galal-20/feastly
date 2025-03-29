import 'package:feastly/src/core/constants/colors.dart';
import 'package:feastly/src/core/utils/size_config.dart';
import 'package:flutter/material.dart';

class NutritionWidget extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final num;
  // ignore: prefer_typing_uninitialized_variables
  final unit;
  const NutritionWidget({super.key, required this.num, required this.unit});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.height *0.1,
      width: SizeConfig.height *0.1,
      decoration: BoxDecoration(
        border: Border.all(
          width: SizeConfig.height *0.004,
          color: AppColors.splashColor,
        ),
        shape: BoxShape.circle,
      ),
      child: Padding(
        padding:  EdgeInsets.fromLTRB(0, SizeConfig.height *0.02, 0, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
            
              num.toString(),
              style: Theme.of(context)
                  .textTheme
                  .displaySmall!
                  .copyWith(color: AppColors.splashColor),
            ),
            Text(
              unit.toString(),
              style: Theme.of(context)
                  .textTheme
                  .displayMedium!
                  .copyWith(color: AppColors.splashColor),
            ),
          ],
        ),
      ),
    );
  }
}
