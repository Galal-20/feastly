import 'dart:io';
import 'package:feastly/src/core/constants/colors.dart';
import 'package:feastly/src/features/home/presentation/bloc/add_your_recipe_bloc/add_your_recipe_bloc.dart';
import 'package:feastly/src/features/home/presentation/bloc/add_your_recipe_bloc/add_your_recipe_event.dart';
import 'package:feastly/src/features/home/presentation/bloc/add_your_recipe_bloc/add_your_recipe_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomMealImage extends StatelessWidget {
  const CustomMealImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BlocBuilder<AddYourRecipeBloc,AddYourRecipeState>(
          builder: (context, state) {
            String? imagePath;
            if (state is ImagePicked) {
              imagePath = state.imagePath;
            }
            return CircleAvatar(
              backgroundColor: AppColors.splashColor,
              radius: 65,
              backgroundImage:
                  imagePath != null ? FileImage(File(imagePath)) : null,
              child: imagePath == null
                  ? Image.asset(
                      'assets/images/chef_hat.png',
                      width: 100,
                      height: 100,
                      fit: BoxFit.contain,
                    )
                  : null,
            );
          },
        ),
        Positioned(
          bottom: 10,
          left: 100,
          child: CircleAvatar(
            backgroundColor: AppColors.tWhite,
            child: IconButton(
              onPressed: () {
                context.read<AddYourRecipeBloc>().add(PickImageEvent());
              },
              icon: const Icon(Icons.add_a_photo_outlined),
            ),
          ),
        ),
      ],
    );
  }
}