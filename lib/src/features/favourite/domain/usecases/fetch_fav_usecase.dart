import 'package:feastly/src/features/ai_chat/data/models/ai_result_model/ai_result_model.dart';
import 'package:feastly/src/features/favourite/domain/repositories/repo.dart';

class FetchFavUsecase {
  final FavouriteRepository repository;

  FetchFavUsecase(this.repository);

  Stream<List<AiResultModel>> call()  {
    return  repository.getFavourites();
  }
}
