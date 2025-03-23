import 'package:feastly/src/core/utils/size_config.dart';
import 'package:feastly/src/features/ai_chat/domain/entities/ai_chat_entity.dart';
import 'package:feastly/src/features/ai_chat/presentation/widgets/custom_ai_container_bottom_row.dart';
import 'package:feastly/src/features/ai_chat/presentation/widgets/custom_ai_container_image_widget.dart';
import 'package:flutter/material.dart';

class CustomAiFoodContainer extends StatelessWidget {
  const CustomAiFoodContainer({
    super.key,
    required this.aiChatEntity,
  });
  final AiChatEntity aiChatEntity;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeConfig.height * 0.4,
      width: SizeConfig.width * 0.7,
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
    );
  }
}
