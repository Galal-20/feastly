import 'package:feastly/src/core/constants/colors.dart';
import 'package:feastly/src/core/utils/size_config.dart';
import 'package:feastly/src/features/ai_chat/domain/entities/ai_chat_entity.dart';
import 'package:flutter/material.dart';

class CustomAiContainerBottomRow extends StatelessWidget {
  const CustomAiContainerBottomRow({
    super.key,
    required this.aiChatEntity,
  });

  final AiChatEntity aiChatEntity;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '${aiChatEntity.noOfIngredients} Ingrediants',
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Color(0xff8A8A8A),
                fontWeight: FontWeight.w500,
              ),
        ),
        SizedBox(
          width: SizeConfig.width * 0.04,
        ),
        Text(
          '${aiChatEntity.time} Mins',
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
                color: AppColors.splashColor,
                fontWeight: FontWeight.w500,
              ),
        ),
      ],
    );
  }
}
