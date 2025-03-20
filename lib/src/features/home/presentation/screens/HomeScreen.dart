import 'package:feastly/src/features/home/presentation/widgets/TrendingRecipesWidget.dart';
import 'package:feastly/src/features/home/presentation/widgets/build_app_floating_buttons.dart';
import 'package:flutter/material.dart';
import '../../../../core/constants/strings.dart';
import '../widgets/RecommededForYouWidget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    animation = Tween<double>(begin: 0, end: 1).animate(controller);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                RecipesWidget(recipesType: AppStrings.yourRecipes),
                RecipesWidget(recipesType: AppStrings.trendingMeal),
                SizedBox(
                  height: 10,
                ),
                RecommendedForYouWidget(),
              ],
            ),
          ),
          BuildAppFloatingButtons(
            animation: animation,
            controller: controller,
          ),
        ],
      ),
    );
  }
}
