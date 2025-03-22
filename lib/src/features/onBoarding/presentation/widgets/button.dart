import 'package:flutter/material.dart';

import '../../../../core/constants/colors.dart';

class PublicButton extends StatelessWidget {
  final Color backgroundColor;
  final Color textColor;
  final VoidCallback function;
  final double? width;
  final double height;
  final double borderRadius;
  final String text;
  final EdgeInsetsGeometry padding;

  const PublicButton({
    super.key,
    this.backgroundColor = AppColors.tPrimaryColor,
    required this.function,
    this.width,
    required this.text,
    this.borderRadius = 5,
    this.height = 52,
    this.textColor = Colors.white,
    this.padding = const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: MaterialButton(
        height: height,
        color: backgroundColor,
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        onPressed: function,
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Text(
            text,
            style: TextStyle(color: textColor, fontSize: 16),
          ),
        ),
      ),
    );
  }
}
