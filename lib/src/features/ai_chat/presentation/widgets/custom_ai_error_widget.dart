import 'package:feastly/src/core/constants/colors.dart';
import 'package:feastly/src/core/constants/images.dart';
import 'package:feastly/src/core/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:gif_view/gif_view.dart';

class CustomAiErrorWidget extends StatelessWidget {
  const CustomAiErrorWidget({super.key, required this.errMsg});
  final String errMsg;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GifView.asset(
          aiFailAnimation,
          height: SizeConfig.height * 0.3,
          loop: true,
        ),
        SizedBox(
          height: SizeConfig.height * 0.02,
        ),
        Text(
          errMsg,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.displayLarge!.copyWith(
                color: AppColors.tFailRed,
              ),
        ),
      ],
    );
  }
}
