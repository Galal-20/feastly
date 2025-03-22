import 'package:dio/dio.dart';
import 'package:feastly/src/features/foodDetails/data/models/meal_response.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
part 'retrofit.g.dart';

@RestApi(baseUrl: "https://www.themealdb.com/api/json/v1/1/")
abstract class RetrofitServices {
  factory RetrofitServices(Dio dio, {String baseUrl}) = _RetrofitServices;

  @GET("lookup.php")
  Future<MealResponse> getMealById(@Query("i") String id);

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
// Increases connect timeout for better handling
// Sets Accept header for JSON requests
createDioObject() {
  Dio dio = Dio()
    ..options.connectTimeout = Duration(seconds: 5)
    ..options.receiveTimeout = Duration(seconds: 10)
    ..options.headers = {'Accept': 'application/json'}
    ..interceptors.add(LogInterceptor(
      request: true,
      requestBody: true,
      responseBody: true,
      error: true,
    ));
  return dio;
}
/*createDioObject() {
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
}*/
