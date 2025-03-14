import 'package:feastly/src/core/components/button.dart';
import 'package:feastly/src/core/components/text_form_field.dart';
import 'package:feastly/src/core/constants/colors.dart';
import 'package:feastly/src/core/constants/strings.dart';
import 'package:feastly/src/core/utils/app_text_styles.dart';
import 'package:feastly/src/core/utils/size_config.dart';
import 'package:feastly/src/features/auth/persentation/AuthBloc/AuthBloc.dart';
import 'package:feastly/src/features/auth/persentation/AuthBloc/AuthState.dart';
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
    final state = context.read<AuthBloc>().state;
    if (state is Authenticated) {
      nameController = TextEditingController(text: state.displayName);
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
    final state = context.watch<AuthBloc>().state as Authenticated;

    return Column(
      spacing: SizeConfig.height * 0.025,
      children: [
        TextFieldClass.buildTextFormField(
            hintText: fullName,
            controller: nameController,
            borderColor: splashColor,
            radius: 8),
        TextFieldClass.buildTextFormField(
            enabled: false,
            intialValue: state.email,
            hintText: email,
            borderColor: splashColor,
            radius: 8),
        TextFieldClass.buildTextFormField(
            intialValue: '01000000000',
            hintText: phone,
            borderColor: splashColor,
            radius: 8),
        TextFieldClass.buildTextFormField(
            enabled: false,
            intialValue: "********",
            hintText: password,
            obscureText: true,
            borderColor: splashColor,
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
            } else if (nameController.text != state.displayName) {
              context.read<ProfileBloc>().add(
                    UpdateProfile(fullName: nameController.text),
                  );
            }
          },
          backgroundColor: splashColor,
          style: AppTextStyles.styleMedium25(context),
        ),
      ],
    );
  }
}
