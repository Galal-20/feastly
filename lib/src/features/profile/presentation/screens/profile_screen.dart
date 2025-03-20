import 'package:feastly/src/core/constants/strings.dart';
import 'package:feastly/src/core/utils/size_config.dart';
import 'package:feastly/src/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:feastly/src/features/profile/presentation/widgets/profile_screen_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/DI/service_locator.dart';


class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return BlocProvider(
      create: (context) =>
      ProfileBloc(sl(), sl())
        ..add(ProfileData()),
      child: BlocListener<ProfileBloc, ProfileState>(
        listener: (context, state) {
          if (state is ProfileUpdated) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(AppStrings.profileUpdatedSuccess),
              ),
            );
          }
        },
        child: Scaffold(
          // appBar: CustomAppBar(),
          body: BlocBuilder<ProfileBloc, ProfileState>(
            builder: (context, state) {
              if(state is ProfileLoading){
                return Center(child: CircularProgressIndicator());

              }
              if(state is ProfileLoaded || state is ProfileUpdated) {
                return ProfileScreenBody();
              }else {
                return Container();
              }

            },
          ),
        ),
      ),
    );
  }
}
