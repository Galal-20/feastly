import 'package:feastly/src/core/constants/strings.dart';
import 'package:feastly/src/core/service_locator/service_locator.dart';
import 'package:feastly/src/core/utils/size_config.dart';

import 'package:feastly/src/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:feastly/src/features/profile/presentation/widgets/custom_app_bar.dart';
import 'package:feastly/src/features/profile/presentation/widgets/profile_screen_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});


  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return BlocListener<ProfileBloc, ProfileState>(
      listener: (context, state) {
        if (state is ProfileUpdated) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(profileUpdatedSuccess),
            ),
          );
        }
      },
      child: Scaffold(
       // appBar: CustomAppBar(),
        body: ProfileScreenBody(),
      ),
    );
  }
}
