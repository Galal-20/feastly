import 'package:feastly/src/features/homePage/presentation/bloc/NavEvent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/constants/colors.dart';
import '../bloc/NavBloc.dart';

class NavItem extends StatelessWidget {
  final String svgPath;
  final int index;
  final int selectedIndex;

  const NavItem({
    super.key,
    required this.svgPath,
    required this.index,
    required this.selectedIndex,
  });

  @override
  Widget build(BuildContext context) {
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