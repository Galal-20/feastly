import 'package:feastly/src/core/network/pixabay_api.dart';
import 'package:feastly/src/features/ai_chat/domain/entities/image_enitiy.dart';

abstract class ImageRemoteDataSource {
  Future<ImageEnitiy> getImage(String query);
}

class ImageRemoteDataSourceImpl implements ImageRemoteDataSource {
  final PixabayApi pixabayApi;

  ImageRemoteDataSourceImpl({required this.pixabayApi});
  @override
  Future<ImageEnitiy> getImage(String query) async {
    return await pixabayApi.getFoodImage(
        '34613538-d7a6083f2da4cc5bc795858bb', query, 'food');
  }
}
