import 'package:feastly/src/features/ai_chat/data/models/ai_result_model/ai_result_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

abstract class FirebaseFavService {
  Future<void> storeRecipeAsFavFromAi(AiResultModel aiResultModel);
  Stream<List<AiResultModel>> fetchFavRecipes();
  Future<void> removeRecipeFromFav(AiResultModel aiResultModel);
  Future<String?> uploadImageFromUrl(
      String imageUrl, User user, FirebaseStorage storage);
}