import 'package:json_annotation/json_annotation.dart';

part 'meal.g.dart';

@JsonSerializable()
class Meal {
  final String idMeal;
  final String strMeal;
  final String? strCategory;
  final String? strArea;
  final String? strInstructions;
  final String? strMealThumb;
  final String? strTags;
  final String? strYoutube;

  Meal({
    required this.idMeal,
    required this.strMeal,
    this.strCategory,
    this.strArea,
    this.strInstructions,
    this.strMealThumb,
    this.strTags,
    this.strYoutube,
  });

  /// تحويل JSON إلى كائن Meal
  factory Meal.fromJson(Map<String, dynamic> json) => _$MealFromJson(json);

  /// تحويل كائن Meal إلى JSON
  Map<String, dynamic> toJson() => _$MealToJson(this);
}
