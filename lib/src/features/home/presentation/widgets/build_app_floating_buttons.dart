import 'package:feastly/src/core/app_router/app_routes.dart';
import 'package:feastly/src/core/constants/colors.dart';
import 'package:feastly/src/features/home/presentation/widgets/custom_floating_button.dart';
import 'package:feastly/src/features/home/presentation/widgets/flow_widget_deleget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BuildAppFloatingButtons extends StatelessWidget {
  const BuildAppFloatingButtons({
    super.key,
    required this.animation,
    required this.controller,
  });

  final Animation<double> animation;
  final AnimationController controller;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, _) => Flow(
        delegate: FlowWidgetDelegate(
          animation: animation,
          elementsSpacing: 35,
          iconsSpacing: 10,
          curve: Curves.ease,
        ),
        children: [
          CustomFloatingButton(
            heroTag: "add",
            child: Icon(
              Icons.add,
              color: AppColors.tWhite,
            ),
            onPressed: () {
              context.pushNamed(AppRoutes.kAddUrRecipeView);
            },
          ),
          CustomFloatingButton(
            heroTag: "aiChat",
            child: Icon(
              Icons.chat,
              color: AppColors.tWhite,
            ),
            onPressed: () {
              GoRouter.of(context).push(AppRoutes.kAiChatView);
            },
          ),
          CustomFloatingButton(
            heroTag: "more",
            child: Icon(
              Icons.more_horiz,
              color: AppColors.tWhite,
            ),
            onPressed: () async {
              if (controller.isCompleted) {
                await controller.reverse();
              } else {
                await controller.forward();
              }
            },
          ),
        ],
      ),
    );
  }
}
