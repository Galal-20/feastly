import 'package:dartz/dartz.dart';
import 'package:feastly/src/core/error/failures.dart';
import 'package:feastly/src/features/ai_chat/data/data_source/image_remote_data_source.dart';
import 'package:feastly/src/features/ai_chat/domain/entities/image_enitiy.dart';
import 'package:feastly/src/features/ai_chat/domain/repos/get_image_repo.dart';

class GetImageRepoImpl extends GetImageRepo {
  final ImageRemoteDataSource imageRemoteDataSource;

  GetImageRepoImpl({required this.imageRemoteDataSource});
  @override
  Future<Either<Failures, ImageEnitiy>> getImage(String query) async {
    try {
      var result = await imageRemoteDataSource.getImage(query);

      return Right(result);
    } catch (e) {
      return left(GeminiFailures(message: e.toString()));
    }
  }
}
