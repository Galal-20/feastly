import 'package:feastly/src/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../bloc/NavBloc.dart';
import '../bloc/NavEvent.dart';
import '../bloc/NavState.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavBloc, NavState>(
      builder: (context, state) {
        return Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              height: 60,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)],
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildNavItem(
                      context, "assets/svg/home.svg", 0, state.selectedIndex),
                  _buildNavItem(
                      context, "assets/svg/heart.svg", 1, state.selectedIndex),
                  _buildNavItem(
                      context, "assets/svg/search.svg", 2, state.selectedIndex),
                  _buildNavItem(
                      context, "assets/svg/user.svg", 3, state.selectedIndex),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildNavItem(
      BuildContext context, String svgPath, int index, int selectedIndex) {
    bool isSelected = index == selectedIndex;

    return GestureDetector(
      onTap: () => context.read<NavBloc>().add(NavItemSelected(index)),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        width: isSelected ? 60 : 50,
        height: isSelected ? 60 : 50,
        decoration: BoxDecoration(
          color: isSelected ? AppColors.splashColor : Colors.transparent,
          shape: BoxShape.circle,
          boxShadow: isSelected
              ? [BoxShadow(color: Colors.black26, blurRadius: 5)]
              : [],
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: SvgPicture.asset(
            svgPath,
            colorFilter: ColorFilter.mode(
                isSelected ? Colors.white : Colors.black, BlendMode.srcIn),
          ),
        ),
      ),
    );
  }
}
