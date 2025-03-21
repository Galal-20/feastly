import 'package:feastly/src/core/constants/colors.dart';
import 'package:flutter/material.dart';

class CustomAddMealButton extends StatelessWidget {
  const CustomAddMealButton({
    super.key,
    required this.onPressed, required this.child,
  });
  final void Function() onPressed;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: Size(MediaQuery.of(context).size.width * 0.8, 60),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        backgroundColor: AppColors.splashColor,
      ),
      onPressed: onPressed,
      child: child,
    );
  }
}
