import 'package:feastly/src/core/utils/size_config.dart';
import 'package:flutter/material.dart';

class CustomAiContainerImageWidget extends StatelessWidget {
  const CustomAiContainerImageWidget({
    super.key,
    required this.imageUrl,
  });
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.height * 0.2,
      width: SizeConfig.width * 0.7,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(imageUrl),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(30),
      ),
    );
  }
}
