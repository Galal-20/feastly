import 'package:feastly/assets.dart';
import 'package:feastly/src/core/constants/colors.dart';
import 'package:feastly/src/core/constants/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomAiTextField extends StatelessWidget {
  const CustomAiTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(
            width: 1.5,
            color: Color(0xffDEDEDE),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(
            width: 1.5,
            color: Color(0xffDEDEDE),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(
            width: 2,
            color: Color(0xffDEDEDE),
          ),
        ),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        hintText: AppStrings.aiChatScreenTextFieldHint,
        hintStyle: Theme.of(context)
            .textTheme
            .bodyLarge!
            .copyWith(color: Color(0xff767676)),
        suffixIcon: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SvgPicture.asset(
            Assets.submitIcon,
            colorFilter:
                ColorFilter.mode(AppColors.splashColor, BlendMode.srcIn),
            width: 30,
            height: 30,
          ),
        ),
      ),
    );
  }
}
