import 'package:feastly/src/core/constants/keys.dart';
import 'package:feastly/src/features/home/domain/usecases/recommended_for_you_section/recommended_for_you_usecase.dart';
import 'package:feastly/src/features/home/presentation/bloc/recommended_for_you_bloc/recommended_for_you_bloc.dart';
import 'package:feastly/src/features/home/presentation/bloc/recommended_for_you_bloc/recommended_for_you_event.dart';
import 'package:feastly/src/features/home/presentation/bloc/recommended_for_you_bloc/recommended_for_you_state.dart';
import 'package:feastly/src/features/homePage/presentation/bloc/NavBloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/DI/service_locator.dart';
import '../../../../core/app_router/app_routes.dart';
import '../../../../core/components/recommended_card.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/constants/strings.dart';
import '../../../ai_chat/domain/use_case/get_image_use_case.dart';
import '../../../ai_chat/presentation/widgets/custom_ai_error_widget.dart';

class RecommendedForYouWidget extends StatelessWidget {
  const RecommendedForYouWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Gemini.init(apiKey: googleApiKey);
    return BlocProvider(
        create: (context) {
          final bloc = RecommendedForYouBloc(
              sl<GetRecommendedMealsUseCase>(), sl<GetImageUseCase>())
            ..add(HomeRecommendedForYouEvent(
                isLoaded: context.read<NavBloc>().isRecommendedLoaded));
          return bloc;
        },
        child: BlocConsumer<RecommendedForYouBloc, RecommendedForYouState>(
            listener: (context, state) {
          if (state is RecommendedForYouMapped) {
            GoRouter.of(context).push(
              AppRoutes.kFoodDetailsScreen,
              extra: {
                'meal': state.mappedMeal,
                'isFromHome': false,
                'isFav': false
              },
            ).then((_) {
              context.read<RecommendedForYouBloc>().add(
                  HomeRecommendedForYouEvent(
                      isLoaded: context.read<NavBloc>().isRecommendedLoaded));
            });
          }
        }, builder: (context, state) {
          if (state is RecommendedForYouLoading) {
            return Center(
                child: CircularProgressIndicator(color: AppColors.splashColor));
          }
          if (state is RecommendedForYouError) {
            return CustomAiErrorWidget(errMsg: state.message);
          }
          if (state is RecommendedForYouSuccess) {
            if (state.recommendedForYouEntity == null) {
              state.recommendedForYouEntity =
                  context.read<NavBloc>().storedNavBlocRecommendedRecipesList;
            } else {
              context.read<NavBloc>().storedNavBlocRecommendedRecipesList =
                  state.recommendedForYouEntity!;
              context.read<NavBloc>().isRecommendedLoaded = true;
            }
            var recommendedMealsList =
                state.recommendedForYouEntity!.recommendedMeals;
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppStrings.recommendedMeal,
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                  SizedBox(height: 10),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: recommendedMealsList.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          context.read<RecommendedForYouBloc>().add(
                              MapMealForDetailsEvent(
                                  meal: recommendedMealsList[index]));
                        },
                        child: RecommendedCard(
                          imagePath: recommendedMealsList[index].imageUrl,
                          name: recommendedMealsList[index].foodTitle,
                          noOfIngredients:
                              recommendedMealsList[index].numberOfIngredients,
                          time: recommendedMealsList[index].cookingTime,
                        ),
                      );
                    },
                  ),
                ],
              ),
            );
          }
          return SizedBox();
        }));
  }
}
