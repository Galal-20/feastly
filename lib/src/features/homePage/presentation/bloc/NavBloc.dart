import 'package:feastly/src/features/home/domain/entities/recommended_for_you_section/recommended_for_you_entity.dart';
import 'package:feastly/src/features/home/domain/entities/trending_recipes_section/trending_recipes_entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'NavEvent.dart';
import 'NavState.dart';

class NavBloc extends Bloc<NavEvent, NavState> {
  TrendingRecipesEntity storedNavBlocTrendingRecipesList =
      TrendingRecipesEntity(trendingMeals: []);
  RecommendedForYouEntity storedNavBlocRecommendedRecipesList =
      RecommendedForYouEntity(recommendedMeals: []);
  bool isTrendingLoaded = false;
  bool isRecommendedLoaded = false;
  NavBloc() : super(NavState(selectedIndex: 0)) {
    on<NavItemSelected>((event, emit) {
      emit(NavState(selectedIndex: event.index));
    });
  }
}
