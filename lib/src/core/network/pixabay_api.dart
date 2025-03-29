import 'package:feastly/src/features/ai_chat/data/models/image_model/pixabay_response_model.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'pixabay_api.g.dart';

@RestApi(baseUrl: "https://pixabay.com")
abstract class PixabayApi {
  factory PixabayApi(Dio dio, {String baseUrl}) = _PixabayApi;

  @GET("/api/")
  Future<PixabayResponse> getFoodImage(
    @Query("key") String apiKey,
    @Query("q") String query,
    @Query("category") String category,
  );
}
