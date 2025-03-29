import 'dart:io';

import 'package:feastly/src/core/constants/colors.dart';
import 'package:feastly/src/core/constants/strings.dart';
import 'package:feastly/src/features/home/data/models/add_your_recipe_model.dart';
import 'package:feastly/src/features/home/presentation/bloc/add_your_recipe_bloc/add_your_recipe_bloc.dart';
import 'package:feastly/src/features/home/presentation/bloc/add_your_recipe_bloc/add_your_recipe_event.dart';
import 'package:feastly/src/features/home/presentation/bloc/add_your_recipe_bloc/add_your_recipe_state.dart';
import 'package:feastly/src/features/home/presentation/widgets/add_your_meal_widgets/add_your_meal_fields.dart';
import 'package:feastly/src/features/home/presentation/widgets/add_your_meal_widgets/custom_add_meal_button.dart';
import 'package:feastly/src/features/home/presentation/widgets/add_your_meal_widgets/custom_meal_image.dart';
import 'package:feastly/src/features/home/presentation/widgets/add_your_meal_widgets/ingrediants_fields.dart';
import 'package:feastly/src/features/home/presentation/widgets/add_your_meal_widgets/nutration_fields.dart';
import 'package:feastly/src/features/home/presentation/widgets/add_your_meal_widgets/steps_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class BuildAddYourMealBody extends StatelessWidget {
  const BuildAddYourMealBody({
    super.key,
    required this.formKey,
    required this.mealTypeController,
    required this.mealNameController,
    required this.mealTimeController,
    required this.ingrediantsNoController,
    required this.summaryController,
    required this.proteinController,
    required this.carbController,
    required this.fatsController,
    required this.kcalController,
    required this.vitaminsController,
    required this.ingredient1Controller,
    required this.piece1Controller,
    required this.ingredient2Controller,
    required this.piece2Controller,
    required this.ingredient3Controller,
    required this.piece3Controller,
    required this.ingredient4Controller,
    required this.piece4Controller,
    required this.stepsController,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController mealTypeController;
  final TextEditingController mealNameController;
  final TextEditingController mealTimeController;
  final TextEditingController ingrediantsNoController;
  final TextEditingController summaryController;
  final TextEditingController proteinController;
  final TextEditingController carbController;
  final TextEditingController fatsController;
  final TextEditingController kcalController;
  final TextEditingController vitaminsController;
  final TextEditingController ingredient1Controller;
  final TextEditingController piece1Controller;
  final TextEditingController ingredient2Controller;
  final TextEditingController piece2Controller;
  final TextEditingController ingredient3Controller;
  final TextEditingController piece3Controller;
  final TextEditingController ingredient4Controller;
  final TextEditingController piece4Controller;
  final TextEditingController stepsController;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddYourRecipeBloc, AddYourRecipeState>(
      listener: (context, state) {
        if (state is StoreSuccess) {
          debugPrint("succccesssssssssss");
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Recipe added successfully!')),
          );
          context.pop();
        } else if (state is StoreError) {
          debugPrint("errrrorrrrrr in savvving");
          debugPrint(state.message);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message)),
          );
        } else if (state is ImageError) {
          debugPrint("errrorrrrr in immmageee");
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message)),
          );
        }
      },
      builder: (context, state) {
        return Form(
          key: formKey,
          child: ListView(
            children: [
              const Center(child: CustomMealImage()),
              const SizedBox(height: 20),
              AddYourMealFields(
                mealTypeController: mealTypeController,
                mealNameController: mealNameController,
                mealTimeController: mealTimeController,
                mealIngrediantsController: ingrediantsNoController,
                mealSummaryController: summaryController,
              ),
              Text(AppStrings.nutrition,
                  style: Theme.of(context)
                      .textTheme
                      .displayLarge!
                      .copyWith(color: AppColors.splashColor)),
              const SizedBox(height: 16),
              NutrationFields(
                  protineController: proteinController,
                  carbController: carbController,
                  fatsController: fatsController,
                  kcalController: kcalController,
                  vitaminsController: vitaminsController),
              const SizedBox(height: 20),
              Text(AppStrings.ingredients,
                  style: Theme.of(context)
                      .textTheme
                      .displayLarge!
                      .copyWith(color: AppColors.splashColor)),
              const SizedBox(height: 20),
              IngredientsFields(
                ingrediant1Controller: ingredient1Controller,
                piece1Controller: piece1Controller,
                ingrediant2Controller: ingredient2Controller,
                piece2Controller: piece2Controller,
                ingrediant3Controller: ingredient3Controller,
                piece3Controller: piece3Controller,
                ingrediant4Controller: ingredient4Controller,
                piece4Controller: piece4Controller,
              ),
              const SizedBox(height: 20),
              StepsFields(
                  stepsController: stepsController),
              const SizedBox(height: 20),
              CustomAddMealButton(
                child: state is StoreLoading
                    ? CircularProgressIndicator(color: AppColors.tWhite)
                    : Text(
                        AppStrings.addYourRecipe,
                        style: Theme.of(context)
                            .textTheme
                            .displayMedium!
                            .copyWith(color: AppColors.tWhite),
                      ),
                onPressed: () {
                  addYourMeal(context);
                },
              )
            ],
          ),
        );
      },
    );
  }

  void addYourMeal(BuildContext context) {
    if (formKey.currentState!.validate()) {
      final recipe = AddYourRecipeModel(
        mealImage: context.read<AddYourRecipeBloc>().imagePath != null
            ? File(context.read<AddYourRecipeBloc>().imagePath!)
            : '',
        mealType: mealTypeController.text,
        mealName: mealNameController.text,
        ingrediantsNo: ingrediantsNoController.text,
        cookingTime: mealTimeController.text,
        summary: summaryController.text,
        protine: proteinController.text,
        carb: carbController.text,
        fats: fatsController.text,
        kcal: kcalController.text,
        vitamins: vitaminsController.text,
        ingredinat1: ingredient1Controller.text,
        piece1: piece1Controller.text,
        ingredinat2: ingredient2Controller.text,
        piece2: piece2Controller.text,
        ingredinat3: ingredient3Controller.text,
        piece3: piece3Controller.text,
        ingredinat4: ingredient4Controller.text,
        piece4: piece4Controller.text,
        steps: stepsController.text,
      );
      context.read<AddYourRecipeBloc>().add(StoreRecipeEvent(recipe));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill all required fields')),
      );
    }
  }
}
