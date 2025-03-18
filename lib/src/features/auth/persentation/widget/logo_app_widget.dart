import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/images.dart';

class logo_app extends StatelessWidget {
  const logo_app({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white, width: 2),
      ),
      child: Image.asset(
        chefHat,
        width: 80,
        height: 80,
        fit: BoxFit.cover,
      ),
    );
  }
}
