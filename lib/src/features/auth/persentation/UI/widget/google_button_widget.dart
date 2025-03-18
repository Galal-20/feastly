import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/constants/images.dart';
import '../../auth_bloc/auth_bloc.dart';
import '../../auth_bloc/auth_event.dart';


class GoogleButton extends StatelessWidget {
  const GoogleButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            BlocProvider.of<AuthBloc>(context).add(GoogleSignInRequested());
          },
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: Image.asset(
              googleLogo,
              width: 30,
              height: 30,
            ),
          ),
        ),
      ],
    );
  }
}
