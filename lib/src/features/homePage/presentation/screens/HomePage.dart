import 'package:feastly/src/core/constants/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/NavBloc.dart';
import '../bloc/NavState.dart';
import '../widgets/CustomButtonNavBar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BlocBuilder<NavBloc, NavState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            actions: [
              const SizedBox(
                width: 20,
              ),
              Image.asset(
                'assets/images/logo2.png',
                height: 30,
                width: 30,
              ),
              Text(
                AppStrings.feastly,
                style: Theme.of(context).textTheme.displayLarge,
              ),
              const Spacer(),
              Image.asset('assets/images/Notification.png'),
              const SizedBox(
                width: 20,
              ),
            ],
          ),
          body: state.screens[state.selectedIndex],
          bottomNavigationBar: CustomBottomNavBar(),
        );
      },
    );
  }
}
