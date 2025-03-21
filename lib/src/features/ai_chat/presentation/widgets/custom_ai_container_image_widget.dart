import 'package:feastly/src/core/utils/size_config.dart';
import 'package:flutter/material.dart';

class CustomAiContainerImageWidget extends StatelessWidget {
  const CustomAiContainerImageWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.height * 0.2,
      width: SizeConfig.width * 0.7,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
              'https://media.istockphoto.com/id/1457433817/photo/group-of-healthy-food-for-flexitarian-diet.jpg?s=2048x2048&w=is&k=20&c=rRlOrFqCQn8kBDwvZnN75XFxiD0CA6S2LkgVKQRYJ3k='),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(30),
      ),
    );
  }
}
