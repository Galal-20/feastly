import 'package:feastly/src/core/components/button.dart';
import 'package:feastly/src/core/components/text_form_field.dart';
import 'package:feastly/src/core/constants/colors.dart';
import 'package:feastly/src/core/constants/strings.dart';
import 'package:feastly/src/core/utils/app_text_styles.dart';
import 'package:feastly/src/core/utils/size_config.dart';
import 'package:feastly/src/features/auth/persentation/auth_bloc/auth_bloc.dart';
import 'package:feastly/src/features/auth/persentation/auth_bloc/auth_state.dart';
import 'package:feastly/src/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreenFields extends StatefulWidget {
  const ProfileScreenFields({
    super.key,
  });

  @override
  State<ProfileScreenFields> createState() => _ProfileScreenFieldsState();
}

class _ProfileScreenFieldsState extends State<ProfileScreenFields> {
  TextEditingController nameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    final state = context.read<ProfileBloc>().state;
    if (state is ProfileLoaded) {
      nameController = TextEditingController(text: context.read<ProfileBloc>().myuser.displayName);
    } else {
      nameController = TextEditingController();
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final user = context.read<ProfileBloc>().myuser;

    return Column(
      spacing: SizeConfig.height * 0.025,
      children: [
        TextFieldClass.buildTextFormField(
            hintText: fullName,
            controller: nameController,
            borderColor: AppColors.splashColor,
            radius: 8),
        TextFieldClass.buildTextFormField(
            enabled: false,
            intialValue: user.email,
            hintText: email,
            borderColor: AppColors.splashColor,
            radius: 8),
        TextFieldClass.buildTextFormField(
            intialValue: '01000000000',
            hintText: phone,
            borderColor: AppColors.splashColor,
            radius: 8),
        TextFieldClass.buildTextFormField(
            enabled: false,
            intialValue: "********",
            hintText: password,
            obscureText: true,
            borderColor: AppColors.splashColor,
            radius: 8),
        SizedBox(
          height: SizeConfig.height * 0.025,
        ),
        Button(
          isLoading: false,
          text: save,
          onPressed: () {
            if (nameController.text.isEmpty) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(hintFullName),
                ),
              );
            } else if (nameController.text != user.displayName) {
              context.read<ProfileBloc>().add(
                    UpdateProfile(fullName: nameController.text),
                  );
              user.displayName!= nameController.text;
            }
          },
          backgroundColor: AppColors.splashColor,
          style: AppTextStyles.styleMedium25(context),
        ),
      ],
    );
  }
}
