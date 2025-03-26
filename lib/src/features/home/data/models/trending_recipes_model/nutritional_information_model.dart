import 'package:feastly/src/features/home/domain/entities/trending_recipes_section/nutritional_information_entity.dart';

class NutritionalInformation extends NutritionalInformationEntity{

  NutritionalInformation({
    required super.protein,
    required super.carbs,
    required super.fats,
    required super.vitamins,
    required super.kcal,
  });

  factory NutritionalInformation.fromMap(Map<String, dynamic> map) {
    return NutritionalInformation(
      protein: map["protein"] as String,
      carbs: map["carbs"] as String,
      fats: map["fats"] as String,
      vitamins: map["vitamins"]as String,
      kcal: map["kcal"] as String,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "protein": protein,
      "carbs": carbs,
      "fats": fats,
      "vitamins": vitamins,
      "kcal": kcal,
    };
  }
}
