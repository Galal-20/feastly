import 'package:feastly/src/core/components/custom_icon_button.dart';
import 'package:feastly/src/core/constants/colors.dart';
import 'package:feastly/src/core/utils/size_config.dart';
import 'package:flutter/material.dart';

class PickImage extends StatelessWidget {
  const PickImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        CircleAvatar(
          radius: SizeConfig.width * 0.2,
          backgroundColor: tgrey,
        ),
        Positioned(
          bottom: 0,
          right: -2,
          child: CircleAvatar(
            backgroundColor: splashColor,
            radius: SizeConfig.width * 0.065,
            child: FittedBox(
              child: CustomIconButton(
                icon: Icons.edit_outlined,
                iconColor: Colors.white,
                iconSize: SizeConfig.width * 0.08,
              ),
            ),
          ),
        )
      ],
    );
  }
}
