
import 'package:feastly/src/features/home/data/models/recommended_for_you_model/recommended_for_you_model.dart';


abstract class RecommendedForYouRemoteDataSource{
  Future<RecommendedForYouModel> getRecommendedMeals();

}