// import 'dart:convert';
// import 'trending_meals_response.dart';
// import '../../../domain/entities/trending_recipes_section/trending_recipes_entity.dart';
//
// class TrendingRecipesResponseModel extends TrendingRecipesEntity{
//
//   TrendingRecipesResponseModel({required super.trendingMeals});
//
//   // Factory constructor to create an instance from a JSON string
//   factory TrendingRecipesResponseModel.fromJson(String source) {
//     Map<String, dynamic> map = json.decode(source);
//     if (map['trending_meals'] != null && map['trending_meals'] is List) {
//       print("✅ Total meals: ${map['trending_meals'].length}");
//
//       for (var meal in map['trending_meals']) {
//         print("🍽️ Meal: ${meal['food_title']}");
//       }
//     } else {
//       print("⚠️ No meals found in the response!");
//     }
//     return TrendingRecipesResponseModel.fromMap(map);
//   }
//
//   // Factory constructor to create an instance from a Map
//   factory TrendingRecipesResponseModel.fromMap(Map<String, dynamic> map) {
//     return TrendingRecipesResponseModel(
//       trendingMeals: (map['trending_meals'] as List<dynamic>?)
//           ?.map((x) => TrendingMeal.fromMap(x))
//           .toList() ??
//           [],
//     );
//   }
//
//   // Convert object to Map
//   Map<String, dynamic> toMap() {
//     return {
//       "trending_meals": trendingMeals.map((x) => x.toMap()).toList(),
//     };
//   }
//
//   // Convert object to JSON
//   String toJson() => json.encode(toMap());
// }
import 'dart:convert';
import 'trending_meals_response.dart';
import '../../../domain/entities/trending_recipes_section/trending_recipes_entity.dart';

class TrendingRecipesResponseModel extends TrendingRecipesEntity {
  TrendingRecipesResponseModel({required super.trendingMeals});

  /// Creates an instance from a JSON string
  static TrendingRecipesResponseModel fromJson(String source) {
    Map<String, dynamic> map = json.decode(source);

    if (map['trending_meals'] is List) {
      print("✅ Total meals: ${map['trending_meals'].length}");

      for (var meal in map['trending_meals']) {
        print("🍽️ Meal: ${meal['food_title'] ?? 'Unknown'}");
      }
    } else {
      print("⚠️ No meals found in the response!");
    }

    return fromMap(map);
  }

  /// Creates an instance from a Map
  static TrendingRecipesResponseModel fromMap(Map<String, dynamic> map) {
    return TrendingRecipesResponseModel(
      trendingMeals: (map['trending_meals'] as List<dynamic>?)
          ?.map((x) => TrendingMeal.fromMap(x))
          .toList() ??
          [],
    );
  }

  /// Converts the object to a Map
  Map<String, dynamic> toMap() {
    return {
      "trending_meals": trendingMeals.map((x) => x.toMap()).toList(),
    };
  }

  /// Converts the object to a JSON string
  String toJson() => json.encode(toMap());
}
