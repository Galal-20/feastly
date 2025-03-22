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
}

// create Dio Object
createDioObject() {
  Dio dio = Dio();
  dio
    ..options.connectTimeout = Duration(seconds: 5)
    ..options.receiveTimeout = Duration(seconds: 10);
  dio.interceptors.add(LogInterceptor(
    request: true,
    error: true,
    responseBody: true,
    requestBody: true,
  ));
  return dio;
}
