import 'package:feastly/src/core/constants/images.dart';
import 'package:feastly/src/core/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:gif_view/gif_view.dart';

class CustomAiLoadingWidget extends StatelessWidget {
  const CustomAiLoadingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: GifView.asset(
          aiLoadingAnimation,
          height: SizeConfig.height * 0.3,
          loop: true,
        ),
      ),
    );
  }
}
