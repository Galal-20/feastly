import 'package:dio/dio.dart';
import 'package:feastly/src/features/mealDetails/data/models/meal_response.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

part 'retrofit.g.dart';

@RestApi(baseUrl: "https://www.themealdb.com/api/json/v1/1/")
abstract class RetrofitServices {
  factory RetrofitServices(Dio dio, {String baseUrl}) = _RetrofitServices;

  @GET("lookup.php")
  Future<MealResponse> getMealById(@Query("i") String mealId);

  @GET("search.php")
  Future<MealResponse> searchByName(@Query("s") String name);

  @GET("filter.php")
  Future<MealResponse> searchByCategory(@Query("c") String category);

  @GET("filter.php")
  Future<MealResponse> searchByIngredient(@Query("i") String ingredient);

  @GET("filter.php")
  Future<MealResponse> searchByCountry(@Query("a") String country);
}

// create Dio Object
createDioObject() {
  Dio dio = Dio();
  dio
    ..options.connectTimeout = Duration(milliseconds: 1000)
    ..options.receiveTimeout = Duration(milliseconds: 10000);
  dio.interceptors.add(LogInterceptor(
    request: true,
    error: true,
    responseBody: true,
    requestBody: true,
  ));
  return dio;
}
