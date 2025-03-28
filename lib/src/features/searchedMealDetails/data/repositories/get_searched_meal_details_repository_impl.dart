import 'package:dartz/dartz.dart';
import 'package:feastly/src/core/error/exceptions.dart';
import 'package:feastly/src/core/error/failures.dart';
import 'package:feastly/src/features/searchedMealDetails/data/data_source/get_searched_meal_details_remote_data_source.dart';
import 'package:feastly/src/features/searchedMealDetails/data/models/meal.dart';
import 'package:feastly/src/features/searchedMealDetails/domain/repositories/get_searched_meal_details_repository.dart';

class GetSearchedMealDetailsRepositoryImpl implements GetSearchedMealDetailsRepository {
  final GetSearchedMealDetailsRemoteDataSource remoteDataSource;
  GetSearchedMealDetailsRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failures, Meal>> getSearchedMealDetails({required String id}) async {
    try {
      final data = await remoteDataSource.getSearchedMealDetails(id: id);
      return Right(data);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.errormessage));
    } catch (e) {
      return Left(ServerFailure(message: "An unexpected error occurred"));
    }
  }
}
