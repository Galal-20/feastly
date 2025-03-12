import 'package:feastly/src/core/constants/strings.dart';
import 'package:flutter/material.dart';
import '../widgets/RecommededForYouWidget.dart';
import '../widgets/TrendingRecipesWidget.dart';

class HomeScreen extends StatelessWidget{
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        actions: [
          const SizedBox(width: 20,),
          Image.asset('assets/images/logo2.png',height: 30,width: 30,),
          Text(feastly,
            style: Theme.of(context).textTheme.bodyMedium,),
          const Spacer(),
          Image.asset('assets/images/Notification.png'),
          const SizedBox(width: 20,),
        ],
      ),
      body: Column(
        children: [
          TrendingRecipesWidget(),
          RecommendedForYouWidget(),

        ],
      ),

    );
  }


}