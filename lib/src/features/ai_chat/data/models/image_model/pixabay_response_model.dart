import 'package:feastly/src/features/ai_chat/domain/entities/image_enitiy.dart';
import 'package:json_annotation/json_annotation.dart';
part 'pixabay_response_model.g.dart';

@JsonSerializable()
class PixabayResponse extends ImageEnitiy {
  final int total;
  final int totalHits;
  final List<Hit> hits;

  PixabayResponse({
    required this.total,
    required this.totalHits,
    required this.hits,
  }) : super(imageUrl: hits[0].largeImageURL);

  factory PixabayResponse.fromJson(Map<String, dynamic> json) =>
      _$PixabayResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PixabayResponseToJson(this);
}

@JsonSerializable()
class Hit {
  final int id;
  final String pageURL;
  final String type;
  final String tags;
  final String previewURL;
  final int previewWidth;
  final int previewHeight;
  final String webformatURL;
  final int webformatWidth;
  final int webformatHeight;
  final String largeImageURL;
  final int imageWidth;
  final int imageHeight;
  final int imageSize;
  final int views;
  final int downloads;
  final int collections;
  final int likes;
  final int comments;
  final int user_id;
  final String user;
  final String userImageURL;

  Hit({
    required this.id,
    required this.pageURL,
    required this.type,
    required this.tags,
    required this.previewURL,
    required this.previewWidth,
    required this.previewHeight,
    required this.webformatURL,
    required this.webformatWidth,
    required this.webformatHeight,
    required this.largeImageURL,
    required this.imageWidth,
    required this.imageHeight,
    required this.imageSize,
    required this.views,
    required this.downloads,
    required this.collections,
    required this.likes,
    required this.comments,
    required this.user_id,
    required this.user,
    required this.userImageURL,
  });

  factory Hit.fromJson(Map<String, dynamic> json) => _$HitFromJson(json);

  Map<String, dynamic> toJson() => _$HitToJson(this);
}
