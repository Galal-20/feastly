import 'package:feastly/src/core/components/custom_icon_button.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: CustomIconButton(
        icon: Icons.menu,
      ),
      actions: [
        CustomIconButton(
          icon: Icons.notifications,
        ),
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
