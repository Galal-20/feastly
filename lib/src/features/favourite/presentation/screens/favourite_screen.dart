import 'package:feastly/src/features/favourite/presentation/bloc/favorite_bloc.dart';
import 'package:feastly/src/features/favourite/presentation/widgets/favourite_screen_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/Internet_connection/bloc/InternetBloc.dart';
import '../../../../core/Internet_connection/bloc/InternetState.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<InternetBloc, InternetState>(
      listener: (context, internetState) {
        if (internetState is InternetDisconnectedState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                "No Internet Connection",
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              backgroundColor: Colors.red,
              duration: Duration(seconds: 2),
            ),
          );
        } else if (internetState is InternetConnectedState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                "Internet Restored",
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              backgroundColor: Colors.green,
              duration: Duration(seconds: 2),
            ),
          );
        }
      },
      child: BlocBuilder<InternetBloc, InternetState>(
        builder: (context, internetState) {
          if (internetState is InternetDisconnectedState) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.wifi_off, size: 50, color: Colors.red),
                  SizedBox(height: 10),
                  Text(
                    'No Internet Connection',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            );
          }
          return BlocBuilder<FavoriteBloc, FavoriteState>(
            builder: (context, state) {
              if (state is FavoriteLoading) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is FavoriteError) {
                return Center(
                  child: Text(state.message),
                );
              }
              return FavouriteScreenBody();
            },
          );
        },
      ),
    );
  }
}