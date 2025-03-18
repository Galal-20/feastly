import 'package:feastly/src/core/constants/colors.dart';
import 'package:flutter/material.dart';

class CustomFloatingButton extends StatelessWidget {
  const CustomFloatingButton({
    super.key,
    required this.onPressed,
    required this.child,
    required this.heroTag,
  });
  final void Function() onPressed;
  final Widget child;
  final Object heroTag; //unique for every floating action button
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      heroTag: heroTag,
      onPressed: onPressed,
      backgroundColor: AppColors.splashColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: child,
    );
  }
}
