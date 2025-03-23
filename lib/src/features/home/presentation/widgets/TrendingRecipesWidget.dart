import 'package:flutter/material.dart';
import '../../../../core/components/recipe_card.dart';

class RecipesWidget extends StatelessWidget {
  const RecipesWidget({super.key, required this.recipesType});
  final String recipesType;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            recipesType,
            style: Theme.of(context).textTheme.displaySmall,
          ),
          SizedBox(height: 10),
          SizedBox(
            height: 160,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (context, index) {
                return RecipeCard(
                  name: 'Pizza',
                  noOfIngredients: '10',
                  time: '14',
                  child: Image.asset('assets/images/dish1.png'),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
