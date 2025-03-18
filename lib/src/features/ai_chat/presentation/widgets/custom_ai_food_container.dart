import 'package:feastly/src/core/constants/colors.dart';
import 'package:feastly/src/core/utils/size_config.dart';
import 'package:flutter/material.dart';

class CustomAiFoodContainer extends StatelessWidget {
  const CustomAiFoodContainer({
    super.key,
  });

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
                image: NetworkImage(
                    'https://media.istockphoto.com/id/1421688556/photo/beef-shawarma-on-a-dark-background-shawarma-with-beef-in-pita-bread.jpg?s=2048x2048&w=is&k=20&c=nEkg52X3RhTVmAZpBpfBvIsoN_RI4WGdtmPAu7e635Y='),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          Text(
            'Shawrma',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
          ),
          Row(
            children: [
              Text(
                '10 Ingrediants',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Color(0xff8A8A8A),
                      fontWeight: FontWeight.w500,
                    ),
              ),
              SizedBox(
                width: SizeConfig.width * 0.04,
              ),
              Text(
                '14 Mins',
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
