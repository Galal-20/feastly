import 'package:feastly/src/features/ai_chat/data/models/ai_result_model/ai_result_model.dart';

abstract class FavouriteRepository {
  Future<void> addFavourite(AiResultModel aiResultModel);

  Future<void> removeFavourite(AiResultModel aiResultModel);

  Stream<List<AiResultModel>> getFavourites();
}
