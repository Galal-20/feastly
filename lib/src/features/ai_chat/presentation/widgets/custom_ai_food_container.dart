import 'package:feastly/src/core/constants/colors.dart';
import 'package:feastly/src/core/utils/size_config.dart';
import 'package:feastly/src/features/ai_chat/domain/entities/ai_chat_entity.dart';
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
      height: SizeConfig.height * 0.3,
      width: SizeConfig.width * 0.7,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: SizeConfig.height * 0.2,
            width: SizeConfig.width * 0.7,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(aiChatEntity.imageNetworkUrl),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          Text(
            aiChatEntity.foodName,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
            overflow: TextOverflow.ellipsis,
          ),
          Row(
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
          )
        ],
      ),
    );
  }
}
