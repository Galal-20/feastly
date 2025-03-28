
import 'dart:convert';
import 'package:feastly/src/features/home/data/models/recommended_for_you_model/recommended_meal_model.dart';
import 'package:feastly/src/features/home/domain/entities/recommended_for_you_section/recommended_for_you_entity.dart';

class RecommendedForYouModel extends RecommendedForYouEntity {
  RecommendedForYouModel({required super.recommendedMeals});

  /// Creates an instance from a JSON string
  static RecommendedForYouModel fromJson(String source) {
    Map<String, dynamic> map = json.decode(source);
    if (map['recommended_meals'] is List) {
      print("✅ Total meals from recommend: ${map['recommended_meals'].length}");

      for (var meal in map['recommended_meals']) {
        print("🍽️ Meal: ${meal['food_title'] ?? 'Unknown'}");
      }
    } else {
      print("⚠️ No meals found in the response!");
    }

    return fromMap(map);
  }

  /// Creates an instance from a Map
  static RecommendedForYouModel fromMap(Map<String, dynamic> map) {
    return RecommendedForYouModel(
      recommendedMeals: (map['recommended_meals'] as List<dynamic>?)
          ?.map((x) => RecommendedMeal.fromJson(x))
          .toList() ??
          [],
    );
  }

  /// Converts the object to a Map
  Map<String, dynamic> toMap() {
    return {
      "recommended_meals": recommendedMeals.map((x) => x.toJson()).toList(),
    };
  }

  /// Converts the object to a JSON string
  String toJson() => json.encode(toMap());
}
