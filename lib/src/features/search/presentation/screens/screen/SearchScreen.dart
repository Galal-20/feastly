import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

import '../../../../../core/DI/service_locator.dart';
import '../../../../../core/Internet_connection/bloc/InternetBloc.dart';
import '../../../../../core/Internet_connection/bloc/InternetEvent.dart';
import '../../../../../core/Internet_connection/bloc/InternetState.dart';
import '../../../../../core/app_router/app_routes.dart';
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
  bool isConnected = true;

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<InternetBloc, InternetState>(
          listener: (context, state) {
            if (state is InternetDisconnectedState) {
              setState(() => isConnected = false);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("No Internet Connection"),
                  backgroundColor: Colors.red,
                ),
              );
            } else if (state is InternetConnectedState) {
              setState(() => isConnected = true);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Internet Connected"),
                  backgroundColor: Colors.green,
                ),
              );
            }
          },
        ),
      ],
      child: Scaffold(
        backgroundColor: Colors.white,
        body: isConnected ? _buildSearchScreen() : _buildNoInternetScreen(),
      ),
    );
  }

  Widget _buildNoInternetScreen() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.wifi_off, size: 80, color: Colors.grey),
          SizedBox(height: 16),
          Text(
            "No Internet Connection",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text("Please check your connection and try again."),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: () async {
              final isConnected = await InternetConnection().hasInternetAccess;

              if (isConnected) {
                context.read<InternetBloc>().add(InternetConnected());
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Internet connected!"),
                    backgroundColor: Colors.green,
                  ),
                );
              } else {
                context.read<InternetBloc>().add(InternetDisconnected());
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Still no internet connection."),
                    backgroundColor: Colors.red,
                  ),
                );
              }
            },
            child: Text("Retry"),
          )
        ],
      ),
    );
  }

  Widget _buildSearchScreen() {
    return BlocProvider(
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
                      if (isConnected) {
                        context.read<SearchBloc>().add(SearchQueryChanged(query, selectedFilter));
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content:
                                Text("No Internet. Cannot perform search."),
                            backgroundColor: Colors.red,
                          ),
                        );
                      }
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
                  if (state is SearchError) Center(child: Text(state.message)),
                  if (state is SearchSuccess)
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.7,
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: BouncingScrollPhysics(),
                        itemCount: recipes.length,
                        itemBuilder: (context, index) {
                          final recipe = recipes[index];
                          return GestureDetector(
                            onTap: () {
                              context.push(
                                  "${AppRoutes.kFoodDetailsScreen}/${recipe.idMeal}");
                            },
                            child: recipeCard(
                              recipe.strMeal ?? "",
                              recipe.strCategory ?? "",
                              recipe.strArea ?? "",
                              false, // Handle Fav
                              recipe.strMealThumb ?? "",
                            ),
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
    );
  }
}
