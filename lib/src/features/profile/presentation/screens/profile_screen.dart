import 'package:feastly/src/core/utils/size_config.dart';
import 'package:feastly/src/features/profile/presentation/widgets/custom_app_bar.dart';
import 'package:feastly/src/features/profile/presentation/widgets/profile_screen_body.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      appBar: CustomAppBar(),
      body: ProfileScreenBody(),
    );
  }
}
