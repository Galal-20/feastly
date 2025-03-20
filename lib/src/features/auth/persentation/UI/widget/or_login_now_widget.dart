import 'package:flutter/material.dart';

import '../../../../../core/constants/strings.dart';


class or_login_now extends StatelessWidget {
  const or_login_now({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Divider(color: Colors.white)),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            AppStrings.orLoginNow,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
        Expanded(child: Divider(color: Colors.white)),
      ],
    );
  }
}
