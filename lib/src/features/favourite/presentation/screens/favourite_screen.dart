import 'package:feastly/src/features/favourite/presentation/bloc/favorite_bloc.dart';
import 'package:feastly/src/features/favourite/presentation/widgets/favourite_screen_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteBloc, FavoriteState>(builder: (context, state) {
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
    });
  }
}
