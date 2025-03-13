import 'package:feastly/src/core/constants/colors.dart';
import 'package:feastly/src/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constants/strings.dart';

class RecommendedCard extends StatelessWidget {
  final String imagePath;
  final String name;
  final String noOfIngredients;
  final String time;

  RecommendedCard({
    required this.imagePath,
    required this.name,
    required this.noOfIngredients,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: 303,
          height: 203,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Stack(
                  alignment: Alignment.topRight,
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(imagePath)),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SvgPicture.asset('assets/svg/heart.svg',
                          colorFilter:
                              ColorFilter.mode(Colors.white, BlendMode.srcIn)),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    name,
                    style: AppTextStyles.styleBold25(context)
                        .copyWith(color: Colors.black),
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
                        style: AppTextStyles.styleRegular20(context)
                            .copyWith(color: greyColor),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                      Text(
                        time,
                        style: AppTextStyles.styleRegular20(context),
                      )
                    ],
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Row(
                      children: [
                        Container(
                            alignment: Alignment.bottomLeft,
                            height: 18,
                            width: 18,
                            child: Image.asset('assets/images/Star.png')),
                        Container(
                            alignment: Alignment.bottomLeft,
                            height: 18,
                            width: 18,
                            child: Image.asset('assets/images/Star.png')),
                        Container(
                            alignment: Alignment.bottomLeft,
                            height: 18,
                            width: 18,
                            child: Image.asset('assets/images/Star.png')),
                        Container(
                            alignment: Alignment.bottomLeft,
                            height: 18,
                            width: 18,
                            child: Image.asset('assets/images/Star.png')),
                      ],
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
