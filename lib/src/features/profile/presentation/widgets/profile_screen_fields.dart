import 'package:feastly/src/core/components/text_form_field.dart';
import 'package:feastly/src/core/constants/colors.dart';
import 'package:feastly/src/core/utils/size_config.dart';
import 'package:flutter/material.dart';

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
            hintText: "Name", borderColor: splashColor,radius: 8),
        TextFieldClass.buildTextFormField(
            hintText: "E-mail", borderColor: splashColor,radius: 8),
        TextFieldClass.buildTextFormField(
            hintText: "Phonr Number", borderColor: splashColor,radius: 8),
        TextFieldClass.buildTextFormField(
            hintText: "Password", obscureText: true, borderColor: splashColor,radius: 8),
      ],
    );
  }
}

