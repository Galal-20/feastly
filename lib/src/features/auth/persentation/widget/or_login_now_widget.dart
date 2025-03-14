import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/strings.dart';

class or_login_now extends StatelessWidget {
  const or_login_now({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Expanded(child: Divider(color: Colors.white)),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            orLoginNow,
            style: TextStyle(color: Colors.white),
          ),
        ),
        Expanded(child: Divider(color: Colors.white)),
      ],
    );
  }
}

