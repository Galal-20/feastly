import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/DI/service_locator.dart';
import '../../../domain/entities/entity.dart';
import '../../bloc/SearchBloc.dart';
import '../../bloc/SearchEvent.dart';
import '../../bloc/SearchState.dart';
import '../widget/SearchAnchorWidget.dart';
import '../widget/recipeCard.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String selectedFilter = "Default";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocProvider(
        create: (context) => SearchBloc(sl()),
        child: BlocBuilder<SearchBloc, SearchState>(
          builder: (context, state) {
            List<RecipeEntity> recipes = [];

            if (state is SearchSuccess) {
              recipes = state.recipes;
            }

            return SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).size.height * 0.02,
                  horizontal: MediaQuery.of(context).size.width * 0.02,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SearchAnchorWidget(
                      onChanged: (query) {
                        context
                            .read<SearchBloc>()
                            .add(SearchQueryChanged(query, selectedFilter));
                      },
                      onFilterSelected: (filter) {
                        setState(() {
                          selectedFilter = filter;
                        });
                      },
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                    if (state is SearchLoading)
                      Center(child: CircularProgressIndicator()),
                    if (state is SearchError)
                      Center(child: Text(state.message)),
                    if (state is SearchSuccess)
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.7,
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: BouncingScrollPhysics(),
                          itemCount: recipes.length,
                          itemBuilder: (context, index) {
                            final recipe = recipes[index];
                            return recipeCard(
                              recipe.strMeal ?? "",
                              recipe.strCategory ?? "",
                              recipe.strArea ?? "",
                              false, // Handle Fav
                              recipe.strMealThumb ?? "",
                            );
                          },
                        ),
                      ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
