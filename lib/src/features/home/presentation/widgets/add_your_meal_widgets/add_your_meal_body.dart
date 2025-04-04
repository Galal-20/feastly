import 'package:feastly/src/features/home/presentation/widgets/add_your_meal_widgets/build_add_your_meal_body.dart';
import 'package:flutter/material.dart';



class AddYourMealBody extends StatefulWidget {
  const AddYourMealBody({super.key});

  @override
  State<AddYourMealBody> createState() => _AddYourMealBodyState();
}

class _AddYourMealBodyState extends State<AddYourMealBody> {
  final formKey = GlobalKey<FormState>();
  final mealTypeController = TextEditingController();
  final mealNameController = TextEditingController();
  final ingrediantsNoController = TextEditingController();
  final mealTimeController = TextEditingController();
  final summaryController = TextEditingController();
  final proteinController = TextEditingController();
  final carbController = TextEditingController();
  final fatsController = TextEditingController();
  final kcalController = TextEditingController();
  final vitaminsController = TextEditingController();
  final ingredient1Controller = TextEditingController();
  final piece1Controller = TextEditingController();
  final ingredient2Controller = TextEditingController();
  final piece2Controller = TextEditingController();
  final ingredient3Controller = TextEditingController();
  final piece3Controller = TextEditingController();
  final ingredient4Controller = TextEditingController();
  final piece4Controller = TextEditingController();
  final stepsController = TextEditingController();

  @override
  void dispose() {
    mealTypeController.dispose();
    mealNameController.dispose();
    ingrediantsNoController.dispose();
    mealTimeController.dispose();
    summaryController.dispose();
    proteinController.dispose();
    carbController.dispose();
    fatsController.dispose();
    kcalController.dispose();
    vitaminsController.dispose();
    ingredient1Controller.dispose();
    piece1Controller.dispose();
    ingredient2Controller.dispose();
    piece2Controller.dispose();
    ingredient3Controller.dispose();
    piece3Controller.dispose();
    ingredient4Controller.dispose();
    piece4Controller.dispose();
    stepsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BuildAddYourMealBody(
        formKey: formKey,
        mealTypeController: mealTypeController,
        mealNameController: mealNameController,
        mealTimeController: mealTimeController,
        ingrediantsNoController: ingrediantsNoController,
        summaryController: summaryController,
        proteinController: proteinController,
        carbController: carbController,
        fatsController: fatsController,
        kcalController: kcalController,
        vitaminsController: vitaminsController,
        ingredient1Controller: ingredient1Controller,
        piece1Controller: piece1Controller,
        ingredient2Controller: ingredient2Controller,
        piece2Controller: piece2Controller,
        ingredient3Controller: ingredient3Controller,
        piece3Controller: piece3Controller,
        ingredient4Controller: ingredient4Controller,
        piece4Controller: piece4Controller,
        stepsController: stepsController);
  }
}