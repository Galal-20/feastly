import 'package:feastly/src/core/utils/size_config.dart';
import 'package:feastly/src/features/foodDetails/presentation/meal_details_bloc/meal_details_bloc.dart';
import 'package:feastly/src/features/foodDetails/presentation/meal_details_bloc/meal_details_state.dart';
import 'package:feastly/src/features/foodDetails/presentation/widgets/brief_details_raw.dart';
import 'package:feastly/src/features/foodDetails/presentation/widgets/direction_column.dart';
import 'package:feastly/src/features/foodDetails/presentation/widgets/food_details_app_bar.dart';
import 'package:feastly/src/features/foodDetails/presentation/widgets/food_details_header.dart';
import 'package:feastly/src/features/foodDetails/presentation/widgets/food_details_summary.dart';
import 'package:feastly/src/features/foodDetails/presentation/widgets/nutritions_column.dart';
import 'package:feastly/src/features/foodDetails/presentation/widgets/ingridiants_column.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class FoodDetailsScreen extends StatefulWidget {
  const FoodDetailsScreen({super.key});

  @override
  State<FoodDetailsScreen> createState() => _FoodDetailsScreenState();
}

class _FoodDetailsScreenState extends State<FoodDetailsScreen>
    with SingleTickerProviderStateMixin {
  late YoutubePlayerController _youtubePlayerController;
  final GlobalKey _summaryKey = GlobalKey();
  final GlobalKey _ingredientsKey = GlobalKey();
  final GlobalKey _directionKey = GlobalKey();
  bool _isScrolling = false;

  late ScrollController _scrollController;

  late TabController _tabController;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: 3, vsync: this);
    _scrollController = ScrollController();


    _scrollController.addListener(_handleScroll);
  }

  void _scrollToSection(int index) {
    if (_isScrolling) return;

    GlobalKey sectionKey;
    switch (index) {
      case 0:
        sectionKey = _summaryKey;
        break;
      case 1:
        sectionKey = _ingredientsKey;
        break;
      case 2:
        sectionKey = _directionKey;
        break;
      default:
        sectionKey = _summaryKey;
    }

    double sectionPos = _getPosition(sectionKey);

    if (_scrollController.hasClients) {
      _isScrolling = true;
      _scrollController
          .animateTo(
        sectionPos.clamp(0.0, _scrollController.position.maxScrollExtent),
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeInOut,
      )
          .then((_) {
        _isScrolling = false;
      });
    }
  }

  void _handleScroll() {
    if (_isScrolling) return;

    double offset = _scrollController.offset;
    double ingredientsPos = _getPosition(_ingredientsKey);
    double directionPos = _getPosition(_directionKey);

    int newIndex = _tabController.index;

    if (offset >= directionPos) {
      newIndex = 2;
    } else if (offset >= ingredientsPos) {
      newIndex = 1;
    } else {
      newIndex = 0;
    }

    if (newIndex != _tabController.index) {
      _isScrolling = true;
      _tabController.animateTo(newIndex);
      Future.delayed(const Duration(milliseconds: 300), () {
        _isScrolling = false;
      });
    }
  }

  double _getPosition(GlobalKey key) {
    final BuildContext? context = key.currentContext;
    if (context == null) return 0.0;

    final RenderBox box = context.findRenderObject() as RenderBox;
    final double position = box.localToGlobal(Offset.zero).dy;

    final double scrollOffset = _scrollController.offset;
    return position + scrollOffset - kToolbarHeight - 100;
  }

  @override
  void dispose() {
    _tabController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<MealDetailsBloc, MealDetailsState>(
        listener: (context, state) {
          if(state is MealDetailsLoaded){
    _youtubePlayerController = YoutubePlayerController(
        flags: YoutubePlayerFlags(
          autoPlay: false,
        ),
        initialVideoId: YoutubePlayer.convertUrlToId(state.meal.strYoutube ?? 'https://www.youtube.com/')! );
          }
        } ,
        builder: (context, state) {
          if (state is MealDetailsLoading) {
            return Center(child: CircularProgressIndicator());
          }
          if (state is MealDetailsLoaded) {
            return CustomScrollView(
              slivers: [
                FoodDetailsAppBar(meal: state.meal),
                FoodDetailsHeader(
                    scrollToSection: _scrollToSection,
                    tabController: _tabController),
                SliverList(
                    delegate: SliverChildListDelegate.fixed(
                  [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BriefDetailsRaw(
                            category: state.meal.strCategory!,
                            time: state.meal.strArea!,
                            servings: '1 Serving'),
                        FoodDetailsSummary(
                            summaryKey: _summaryKey, meal: state.meal),
                        NutritionsColumn(),
                        SizedBox(height: SizeConfig.height * 0.02),
                        IngridiantsColoumn(
                            widgetKey: _ingredientsKey, meal: state.meal),
                        DirectionColumn(
                          widgetKey: _directionKey,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(14.0),
                          child: YoutubePlayer(
                            controller: _youtubePlayerController,
                          ),
                        )
                      ],
                    )
                  ],
                ))
              ],
              controller: _scrollController,
            );
          }
          if (state is MealDetailsError) {
            return Text('An error occurred: ${state.message}');
          }
          return Container();
        },
      ),
    );
  }
}
