import '../../../data/data_sources/data.dart';
import '../../entities/entity.dart';
import '../repo.dart';

class RecipeRepositoryImpl implements RecipeRepository {
  final RecipeRemoteDataSource remoteDataSource;

  RecipeRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<RecipeEntity>> searchMeals(String query) async {
    return await remoteDataSource.searchMeals(query);
  }
}
