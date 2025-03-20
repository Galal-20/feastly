import 'package:flutter/material.dart';
import '../widget/SearchAnchorWidget.dart';
import '../widget/recipeCard.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late var vertical = MediaQuery.of(context).size.height * 0.02;
  late var horizontal = MediaQuery.of(context).size.width * 0.02;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding:
              EdgeInsets.symmetric(vertical: vertical, horizontal: horizontal),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Search Bar
              SearchAnchorWidget(),
              SizedBox(height: MediaQuery.of(context).size.height * 0.04),
              // Recipes List (Scrollable)
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.7,
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  itemCount: 20,
                  itemBuilder: (context, index) {
                    return recipeCard(
                      "Italian Pizza",
                      "Vegan",
                      "12 ingredients",
                      "30 min",
                      index % 2 == 0, // Alternate favorite icon
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
