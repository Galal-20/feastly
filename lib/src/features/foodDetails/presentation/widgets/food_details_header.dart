import 'package:feastly/src/core/constants/colors.dart';
import 'package:feastly/src/core/utils/size_config.dart';
import 'package:feastly/src/features/foodDetails/presentation/widgets/sticky_tab_bar_delegate.dart';
import 'package:flutter/material.dart';

class FoodDetailsHeader extends StatelessWidget {
  const FoodDetailsHeader({
    super.key,
    required this.scrollToSection, required this.tabController,
  });

  final Function(int) scrollToSection;
  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      pinned: true,
      delegate: StickyTabBarDelegate(TabBar(
        dividerColor: Colors.transparent,
        indicatorWeight: 5,
        indicatorColor: AppColors.splashColor,
        indicatorPadding: EdgeInsets.fromLTRB(
            SizeConfig.height * 0.013, 0, SizeConfig.height * 0.013, 0),
        labelColor: AppColors.splashColor,
        unselectedLabelColor: AppColors.greyColor,
        onTap: scrollToSection,
        controller: tabController,
        tabs: [
          Tab(
            text: 'Summary',
          ),
          Tab(
            text: 'Ingredients',
          ),
          Tab(
            text: 'Direction',
          ),
        ],
      )),
    );
  }
}


