
import 'package:feastly/src/core/error/exceptions.dart';
import 'package:feastly/src/core/network/retrofit.dart';
import 'package:feastly/src/features/searchedMealDetails/data/models/meal.dart';
import 'package:feastly/src/features/searchedMealDetails/data/models/meal.dart' as searched_details;


abstract class GetSearchedMealDetailsRemoteDataSource {
  Future<Meal> getSearchedMealDetails({required String id});
}

class GetSearchedMealDetailsRemoteDataSourceWithRetrofit
    implements GetSearchedMealDetailsRemoteDataSource {
  final RetrofitServices retrofitServices;

  GetSearchedMealDetailsRemoteDataSourceWithRetrofit({required this.retrofitServices});

  @override
  Future<searched_details.Meal> getSearchedMealDetails({required String id}) async {
    try {
      final responseJson = await retrofitServices.getMealById(id);
      if (responseJson.meals == null || responseJson.meals!.isEmpty) {
        throw ServerException(errormessage: "No meal data found");
      }
      return searched_details.Meal.fromJson(responseJson.meals!.first.toJson());
    } catch (e) {
      throw ServerException(errormessage: e.toString());
    }
  }
}
