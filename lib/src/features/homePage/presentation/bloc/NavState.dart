import 'package:flutter/material.dart';

import '../../../favourite/presentation/screens/FavouriteScreen.dart';
import '../../../home/presentation/screens/HomeScreen.dart';
import '../../../profile/presentation/screens/profile_screen.dart';
import '../../../search/presentation/screens/screen/SearchScreen.dart';

class NavState {
  final int selectedIndex;
  final List<Widget> screens;

  NavState({required this.selectedIndex})
      : screens = [
          HomeScreen(),
          FavouriteScreen(),
          SearchScreen(),
          ProfileScreen()
        ];
}
