import 'package:flutter/material.dart';

class FlowWidgetDelegate extends FlowDelegate {
  const FlowWidgetDelegate({
    required this.animation,
    required this.elementsSpacing,
    required this.iconsSpacing,
    required this.curve,
  }) : super(repaint: animation);

  final Animation<double> animation;
  final double elementsSpacing;
  final double iconsSpacing;
  final Curve curve;

  @override
  void paintChildren(FlowPaintingContext context) {
    final size = context.size;
    final x = size.width;
    final y = size.height;

    for (int i = 0; i < context.childCount; i++) {
      if (i == context.childCount - 1) {
        context.paintChild(
          i,
          transform: Matrix4.translationValues(
            x - 50 - elementsSpacing,
            y - 50 - elementsSpacing,
            0,
          ),
        );
      } else {
        var offset = 0.0;
        if (animation.value == 0) {
          offset = 0;
        } else {
          offset = (curve.transform(animation.value) * 30) +
              (iconsSpacing * context.childCount);
        }
        context.paintChild(
          i,
          transform: Matrix4.translationValues(
            x - 50 - elementsSpacing,
            y - offset * (i + 1) - 50 - elementsSpacing,
            0,
          ),
        );
      }
    }
  }

  @override
  bool shouldRepaint(covariant FlowDelegate oldDelegate) {
    return true; // Always repaint
  }
}