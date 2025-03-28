import 'package:feastly/src/core/DI/service_locator.dart';
import 'package:feastly/src/features/favourite/presentation/bloc/favorite_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../favourite/presentation/screens/favourite_screen.dart';
import '../../../home/presentation/screens/HomeScreen.dart';
import '../../../profile/presentation/screens/profile_screen.dart';
import '../../../search/presentation/screens/screen/SearchScreen.dart';

class NavState {
  final int selectedIndex;
  final List<Widget> screens;

  NavState({required this.selectedIndex})
      : screens = [
          HomeScreen(),
          BlocProvider(
            create: (context) => FavoriteBloc(sl(),sl(),sl())..add(FetchFavoriteRecipes()),
            child: FavouriteScreen(),
          ),
          SearchScreen(),
          ProfileScreen()
        ];
}
