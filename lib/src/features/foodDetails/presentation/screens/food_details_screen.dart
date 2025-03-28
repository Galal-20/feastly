import 'package:feastly/src/core/utils/size_config.dart';
import 'package:feastly/src/features/ai_chat/data/models/ai_result_model/ai_result_model.dart';
import 'package:feastly/src/features/foodDetails/presentation/widgets/brief_details_raw.dart';
import 'package:feastly/src/features/foodDetails/presentation/widgets/direction_column.dart';
import 'package:feastly/src/features/foodDetails/presentation/widgets/food_details_app_bar.dart';
import 'package:feastly/src/features/foodDetails/presentation/widgets/food_details_header.dart';
import 'package:feastly/src/features/foodDetails/presentation/widgets/food_details_summary.dart';
import 'package:feastly/src/features/foodDetails/presentation/widgets/nutritions_column.dart';
import 'package:feastly/src/features/foodDetails/presentation/widgets/ingridiants_column.dart';
import 'package:feastly/src/features/home/data/models/trending_recipes_model/trending_meals_response.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

// ignore: must_be_immutable
class FoodDetailsScreen extends StatefulWidget {
  final AiResultModel aiResultModel;
  bool isFave;
  bool isFromHome;
  FoodDetailsScreen(
      {super.key,
      required this.aiResultModel,
      required this.isFave,
      required this.isFromHome});

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
    if (widget.aiResultModel.youtubeUrl != null) {
      _youtubePlayerController = YoutubePlayerController(
          flags: YoutubePlayerFlags(
            autoPlay: false,
          ),
          initialVideoId: YoutubePlayer.convertUrlToId(
              widget.aiResultModel.youtubeUrl ?? 'https://www.youtube.com/')!);
    }

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          FoodDetailsAppBar(
              meal: widget.aiResultModel,
              isFave: widget.isFave,
              isFromHome: widget.isFromHome),
          FoodDetailsHeader(
              scrollToSection: _scrollToSection, tabController: _tabController),
          SliverList(
              delegate: SliverChildListDelegate.fixed(
            [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BriefDetailsRaw(
                      category: widget.aiResultModel.typeOfMeat,
                      time: widget.aiResultModel.time.toString(),
                      servings: widget.aiResultModel.servings.toString()),
                  FoodDetailsSummary(
                      summaryKey: _summaryKey, meal: widget.aiResultModel),
                  NutritionsColumn(meal: widget.aiResultModel),
                  SizedBox(height: SizeConfig.height * 0.02),
                  IngridiantsColoumn(
                      widgetKey: _ingredientsKey, meal: widget.aiResultModel),
                  DirectionColumn(
                    meal: widget.aiResultModel,
                    widgetKey: _directionKey,
                  ),
                  SizedBox(height: SizeConfig.height * 0.02),
                  widget.aiResultModel.youtubeUrl != null
                      ? Padding(
                          padding: const EdgeInsets.all(14.0),
                          child: YoutubePlayer(
                            controller: _youtubePlayerController,
                          ),
                        )
                      : SizedBox(),
                ],
              )
            ],
          ))
        ],
        controller: _scrollController,
      ),
    );

    /*
          if (state is MealDetailsError) {
            return Text('An error occurred: ${state.message}');
          }
          
          return Container();
        },
        */
  }
}
