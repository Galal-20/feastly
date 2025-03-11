import 'package:feastly/src/core/constants/colors.dart';
import 'package:feastly/src/core/utils/size_config.dart';
import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    super.key,
    required this.icon,
    this.onPressed,
    this.iconColor,
    this.iconSize,
  });
  final IconData icon;
  final Function()? onPressed;
  final Color? iconColor;
  final double? iconSize;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(
        icon,
        size: iconSize ?? SizeConfig.width * 0.1,
        color: iconColor ?? tSecondaryColor,
      ),
    );
  }
}
