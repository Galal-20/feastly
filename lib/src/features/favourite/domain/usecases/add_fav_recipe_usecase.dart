import 'package:feastly/src/features/ai_chat/data/models/ai_result_model/ai_result_model.dart';
import 'package:feastly/src/features/favourite/domain/repositories/repo.dart';

class AddFavRecipeUsecase {
  final FavouriteRepository repository;
  AddFavRecipeUsecase(this.repository);
  Future<void> call(AiResultModel aiResultModel) async {
    return await repository.addFavourite(aiResultModel);
  }
}
