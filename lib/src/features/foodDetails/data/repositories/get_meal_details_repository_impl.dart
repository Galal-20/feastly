import 'package:dartz/dartz.dart';
import 'package:feastly/src/core/error/exceptions.dart';
import 'package:feastly/src/core/error/failures.dart';
import 'package:feastly/src/features/foodDetails/data/data_source/get_meal_details_remote_data_source.dart';
import 'package:feastly/src/features/foodDetails/data/models/meal.dart';
import 'package:feastly/src/features/foodDetails/domain/repositories/get_meal_details_repository.dart';

class GetMealDetailsRepositoryImpl implements GetMealDetailsRepository {
  final GetMealDetailsRemoteDataSource remoteDataSource;
  GetMealDetailsRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failures, Meal>> getMealDetails({required String id}) async {
    try {
      final data = await remoteDataSource.getMealDetails(id: id);
      return Right(data);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.errormessage));
    } catch (e) {
      return Left(ServerFailure(message: "An unexpected error occurred"));
    }
  }
}
