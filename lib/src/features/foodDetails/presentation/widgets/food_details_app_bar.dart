import 'package:feastly/src/core/constants/colors.dart';
import 'package:feastly/src/core/utils/size_config.dart';
import 'package:feastly/src/features/ai_chat/data/models/ai_result_model/ai_result_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// ignore: must_be_immutable
class FoodDetailsAppBar extends StatelessWidget {
  final AiResultModel meal;
  bool isFav = false;
  FoodDetailsAppBar({super.key, required this.meal});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(

      // actions: [
      //   IconButton(
      //       icon: Icon(
      //     Icons.favorite_rounded,
      //     color: isFav ? Colors.red : Colors.grey,
      //     size: 40,
      //   ),
      //   onPressed: (){
      //     isFav = !isFav;
      //   }
      //   ),
      // ],
      actions: [
        IconButton(
            icon: Icon(
              Icons.favorite_rounded,
              color: isFav ? Colors.red : Colors.grey,
              size: 40,
            ),
            onPressed: () {
              isFav = !isFav;
            }),
      ],
      //actionsPadding: EdgeInsets.all(10),
      backgroundColor: Colors.white,
      leading: IconButton(
        icon: Icon(Icons.arrow_back_ios),
        onPressed: () {
          context.pop();
        },
      ),
      expandedHeight: SizeConfig.height * 0.3,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: EdgeInsets.only(
            left: SizeConfig.height * 0.04, bottom: SizeConfig.height * 0.016),
        title: Text(
          meal.foodTitle,
          // textAlign: TextAlign.left,
          style: Theme.of(context)
              .textTheme
              .displayLarge!
              .copyWith(color: AppColors.splashColor),
        ),
        background: Image.network(
          meal.imageNetworkUrl,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
