import 'package:flutter/material.dart';

import '../../../../core/constants/strings.dart';
import '../../../../core/utils/app_text_styles.dart';
import '../sign_up/sign_up_screen.dart';

class FooterLogin extends StatelessWidget {
  const FooterLogin({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
         Text(
          dontHaveMessage,
           style: AppTextStyles.styleBold(
             context,
             Colors.white,
             AppTextStyles.getResponsiveFontSize(context, 20),
             FontWeight.bold,
             "Ubuntu"
           ),
         ),
        TextButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => RegisterScreen()));
          },
          child:  Text(
            signUp,
            style: AppTextStyles.styleBold(
                context,
                Colors.white,
              AppTextStyles.getResponsiveFontSize(context, 20),
              FontWeight.bold,
              "Ubuntu"
            ),
          ),
        ),
      ],
    );
  }
}
