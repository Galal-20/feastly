import 'package:feastly/src/core/app_router/app_routes.dart';
import 'package:feastly/src/core/components/button.dart';
import 'package:feastly/src/core/components/text_form_field.dart';
import 'package:feastly/src/core/constants/colors.dart';
import 'package:feastly/src/core/constants/strings.dart';
import 'package:feastly/src/core/helper/shared_prefrences_helper.dart';
import 'package:feastly/src/core/utils/size_config.dart';
import 'package:feastly/src/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:feastly/src/features/profile/presentation/widgets/show_clipper_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/DI/service_locator.dart';
import '../../../auth/data/datasource/auth_data_source.dart';

class ProfileScreenFields extends StatelessWidget {
  const ProfileScreenFields({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: SizeConfig.height * 0.025,
      children: [
        TextFieldClass.buildTextFormField(
            hintText: AppStrings.fullName,
            hintStyle: Theme.of(context).textTheme.labelLarge,
            controller: context.read<ProfileBloc>().nameController,
            borderColor: AppColors.splashColor,
            radius: 8),
        TextFieldClass.buildTextFormField(
            enabled: false,
            intialValue: context.read<ProfileBloc>().user!.email,
            hintText: AppStrings.email,
            hintStyle: Theme.of(context).textTheme.labelLarge,
            borderColor: AppColors.splashColor,
            radius: 8),
        TextFieldClass.buildTextFormField(
            controller: context.read<ProfileBloc>().phone,
            hintText: AppStrings.phone,
            hintStyle: Theme.of(context).textTheme.labelLarge,
            borderColor: AppColors.splashColor,
            radius: 8),
        TextFieldClass.buildTextFormField(
            enabled: false,
            intialValue: "********",
            hintText: AppStrings.password,
            hintStyle: Theme.of(context).textTheme.labelLarge,
            obscureText: true,
            borderColor: AppColors.splashColor,
            radius: 8),
        SizedBox(
          height: SizeConfig.height * 0.025,
        ),
        Button(
          isLoading: false,
          text: AppStrings.save,
          onPressed: () async {
            context.read<ProfileBloc>().add(UpdateProfile());
          },
          backgroundColor: AppColors.splashColor,
        ),
        Button(
          isLoading: false,
          text: AppStrings.signOut,
          onPressed: () {
            showCustomClipperDialog(
                context: context,
                title: AppStrings.signOut,
                onPressed: () {
                  sl<AuthRepository>().logOut();
                  SharedPreferencesHelper.remove(AppStrings.userLoggedInKey);
                  SharedPreferencesHelper.remove(AppStrings.isVerifiedKey);
                  SharedPreferencesHelper.remove(AppStrings.rememberMeKey);
                  context.go(AppRoutes.kLoginView);
                },
                message: AppStrings.areYouWantToSignOut);
          },
          backgroundColor: AppColors.splashColor,
        )
      ],
    );
  }
}
