import 'package:flutter/cupertino.dart';

import '../../../../../core/constants/images.dart';


class background_form extends StatelessWidget {
  const background_form({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Opacity(
        opacity: 0.9,
        child: Image.asset(
          backGround,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
