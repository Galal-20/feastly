import 'dart:developer';

import 'package:feastly/src/core/error/exceptions.dart';
import 'package:feastly/src/core/network/retrofit.dart';
import 'package:feastly/src/features/foodDetails/data/models/meal.dart';
import 'package:feastly/src/features/foodDetails/data/models/meal_response.dart';

abstract class GetMealDetailsRemoteDataSource {
  Future<Meal> getMealDetails({required String id});
}

class GetMealDetailsRemoteDataSourceWithRetrofit
    implements GetMealDetailsRemoteDataSource {
  final RetrofitServices retrofitServices;

  GetMealDetailsRemoteDataSourceWithRetrofit({required this.retrofitServices});

  @override
  Future<Meal> getMealDetails({required String id}) async {
    try {
      final responseJson = await retrofitServices.getMealById(id);
      if (responseJson.meals == null || responseJson.meals!.isEmpty) {
        throw ServerException(errormessage: "No meal data found");
      }
      return responseJson.meals!.first;
    } catch (e) {
      throw ServerException(errormessage: e.toString());
    }
  }
}
