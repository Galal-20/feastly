import 'package:feastly/src/core/app_router/app_routes.dart';
import 'package:feastly/src/core/components/button.dart';
import 'package:feastly/src/core/constants/colors.dart';
import 'package:feastly/src/features/home/presentation/widgets/TrendingRecipesWidget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/strings.dart';
import '../widgets/RecommededForYouWidget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            RecipesWidget(recipesType: yourRecipes),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomButton(
                  isLoading: false,
                  text: addYourRecipe,
                  onPressed: () {
                    context.pushNamed(AppRoutes.kAddurRecipeView);
                  }),
            ),
            RecipesWidget(recipesType: trendingMeal),
            SizedBox(
              height: 10,
            ),
            RecommendedForYouWidget(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: splashColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        onPressed: () {},
        child: Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
