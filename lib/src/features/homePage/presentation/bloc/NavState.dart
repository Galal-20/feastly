import 'package:flutter/material.dart';

import '../../../favourite/presentation/screens/FavouriteScreen.dart';
import '../../../home/presentation/screens/HomeScreen.dart';
import '../../../profile/presentation/screens/ProfileScreen.dart';
import '../../../search/presentation/screens/SearchScreen.dart';



class NavState {
  final int selectedIndex;
  final List<Widget> screens;

  NavState({required this.selectedIndex})
      : screens = [HomeScreen(), FavouriteScreen(), SearchScreen(), ProfileScreen()];
}
