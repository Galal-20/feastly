import 'dart:io';

import 'package:feastly/src/core/components/custom_icon_button.dart';
import 'package:feastly/src/core/constants/colors.dart';
import 'package:feastly/src/core/utils/size_config.dart';
import 'package:feastly/src/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PickImage extends StatelessWidget {
  const PickImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        return Stack(
          clipBehavior: Clip.none,
          children: [
            state is PickImageLoading
                ? Center(
                    child: CircularProgressIndicator(
                      color: AppColors.splashColor,
                    ),
                  )
                : CircleAvatar(
                    radius: SizeConfig.width * 0.2,
                    backgroundColor: AppColors.tGrey,
                    backgroundImage: context.read<ProfileBloc>().file != null
                        ? FileImage(
                            File(context.read<ProfileBloc>().file!.path))
                        : context.read<ProfileBloc>().user!.image != null
                            ? NetworkImage(
                                context.read<ProfileBloc>().user!.image!)
                            : null,
                  ),
            Positioned(
              bottom: 0,
              right: -2,
              child: CircleAvatar(
                backgroundColor: AppColors.splashColor,
                radius: SizeConfig.width * 0.065,
                child: FittedBox(
                  child: CustomIconButton(
                    icon: Icons.edit_outlined,
                    iconColor: Colors.white,
                    iconSize: SizeConfig.width * 0.08,
                    onPressed: () {
                      context.read<ProfileBloc>().add(PickProfileImage());
                    },
                  ),
                ),
              ),
            )
          ],
        );
      },
    );
  }
}
