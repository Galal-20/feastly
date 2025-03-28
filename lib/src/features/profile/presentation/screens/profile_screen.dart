import 'package:feastly/src/core/DI/service_locator.dart';
import 'package:feastly/src/core/constants/strings.dart';
import 'package:feastly/src/core/utils/size_config.dart';
import 'package:feastly/src/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:feastly/src/features/profile/presentation/widgets/profile_screen_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return BlocProvider(
      create: (context) => ProfileBloc(sl(), sl())..add(ProfileData()),
      child: BlocListener<ProfileBloc, ProfileState>(
        listener: (context, state) => _showSnackBar(context, state),
        child: Scaffold(
          body: BlocBuilder<ProfileBloc, ProfileState>(
            builder: (context, state) {
              if (state is ProfileLoading) {
                return const Center(child: CircularProgressIndicator());
              }
              return const ProfileScreenBody();
            },
          ),
        ),
      ),
    );
  }

  void _showSnackBar(BuildContext context, ProfileState state) {
    final messages = {
      ProfileUpdated: AppStrings.profileUpdatedSuccess,
      ProfileError: (state is ProfileError) ? state.message : null,
      PickImageFailed: (state is PickImageFailed) ? state.errorMessage : null,
      PickImageSuccess: AppStrings.imageAddedSuccess,
      ProfileNoChanged: AppStrings.profileNoChanged,
    };

    final message = messages[state.runtimeType];
    if (message != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message)),
      );
    }
  }
}
