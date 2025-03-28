
import '../../models/trending_recipes_model/trending_recipes_response_model.dart';

abstract class TrendingRecipesRemoteDataSource{
  Future<TrendingRecipesResponseModel> getTrendingRecipes();

}