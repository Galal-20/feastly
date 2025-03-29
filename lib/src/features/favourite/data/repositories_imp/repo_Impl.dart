
import 'package:feastly/src/features/ai_chat/data/models/ai_result_model/ai_result_model.dart';
import 'package:feastly/src/features/favourite/data/data_sources/fav_data_source.dart';
import 'package:feastly/src/features/favourite/domain/repositories/repo.dart';

class FavoriteRepoImpl implements FavouriteRepository {
  final FavDataSource favDataSource;

  FavoriteRepoImpl(this.favDataSource);
  @override
  Future<void> addFavourite(AiResultModel aiResultModel)  async{
    try {
      await favDataSource.storeRecipeAsFavFromAi(aiResultModel);
    } catch (e) {
      throw Exception('Failed to add favourite recipe: $e');
    }
    
  }

  @override
  Stream<List<AiResultModel>> getFavourites() {
    try {
      return  favDataSource.fetchFavRecipes();
    } catch (e) {
      throw Exception('Failed to fetch favourite recipes: $e');
    }
  }

  @override
  Future<void> removeFavourite(AiResultModel aiResultModel)  async{
    try {
    await  favDataSource.removeRecipeFromFav(aiResultModel);
    } catch (e) {
      throw Exception('Failed to remove favourite recipe: $e');
    }
  }

}