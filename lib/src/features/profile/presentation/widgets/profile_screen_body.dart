import 'package:feastly/src/core/components/button.dart';
import 'package:feastly/src/core/constants/colors.dart';
import 'package:feastly/src/core/utils/app_text_styles.dart';
import 'package:feastly/src/core/utils/size_config.dart';
import 'package:feastly/src/features/profile/presentation/widgets/pick_image.dart';
import 'package:feastly/src/features/profile/presentation/widgets/profile_screen_fields.dart';
import 'package:flutter/material.dart';

class ProfileScreenBody extends StatelessWidget {
  const ProfileScreenBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.width * 0.05,
            vertical: SizeConfig.height * 0.02),
        child: SingleChildScrollView(
          child: Column(
            children: [
              PickImage(),
              SizedBox(
                height: SizeConfig.height * 0.03,
              ),
              ProfileScreenFields(),
              /*
              SizedBox(
                height: SizeConfig.height * 0.05,
              ),
              Button(
                isLoading: false,
                text: "Save",
                onPressed: () {},
                backgroundColor: AppColors.splashColor,
                style: AppTextStyles.styleMedium25(context),
              ),

               */
            ],
          ),
        ),
      ),
    );
  }
}
