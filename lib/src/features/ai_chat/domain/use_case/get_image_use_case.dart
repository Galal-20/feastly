import 'package:dartz/dartz.dart';
import 'package:feastly/src/core/error/failures.dart';
import 'package:feastly/src/core/use_case/default_use_case.dart';
import 'package:feastly/src/features/ai_chat/domain/entities/image_enitiy.dart';
import 'package:feastly/src/features/ai_chat/domain/repos/get_image_repo.dart';

class GetImageUseCase extends UseCase<ImageEnitiy, String> {
  final GetImageRepo getImageRepo;

  GetImageUseCase({required this.getImageRepo});
  @override
  Future<Either<Failures, ImageEnitiy>> call([String? param]) async {
    return await getImageRepo.getImage(param!);
  }
}
