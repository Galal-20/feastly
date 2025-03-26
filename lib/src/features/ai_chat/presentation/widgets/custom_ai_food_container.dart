import 'package:feastly/src/core/app_router/app_routes.dart';
import 'package:feastly/src/core/utils/size_config.dart';
import 'package:feastly/src/features/ai_chat/data/models/ai_result_model/ai_result_model.dart';
import 'package:feastly/src/features/ai_chat/presentation/widgets/custom_ai_container_bottom_row.dart';
import 'package:feastly/src/features/ai_chat/presentation/widgets/custom_ai_container_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomAiFoodContainer extends StatelessWidget {
  const CustomAiFoodContainer({
    super.key,
    required this.aiChatEntity,
  });
  final AiResultModel aiChatEntity;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeConfig.height * 0.4,
      width: SizeConfig.width * 0.7,
      child: InkWell(
        onTap: () {
          GoRouter.of(context)
              .push(AppRoutes.kFoodDetailsScreen, extra: {'meal': aiChatEntity, 'isFav': false});
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomAiContainerImageWidget(
              imageUrl: aiChatEntity.imageNetworkUrl,
            ),
            SizedBox(
              height: SizeConfig.height * 0.01,
            ),
            Text(
              aiChatEntity.foodName,
              maxLines: 3,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(
              height: SizeConfig.height * 0.01,
            ),
            CustomAiContainerBottomRow(aiChatEntity: aiChatEntity)
          ],
        ),
      ),
    );
  }
}
