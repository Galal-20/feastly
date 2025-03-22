import '../../domain/entities/entity.dart';

class RecipeModel extends RecipeEntity {
  RecipeModel({
    required String idMeal,
    required String strMeal,
    required String strCategory,
    required String strArea,
    required String strMealThumb,
  }) : super(
          idMeal: idMeal,
          strMeal: strMeal,
          strCategory: strCategory,
          strArea: strArea,
          strMealThumb: strMealThumb,
        );

  factory RecipeModel.fromJson(Map<String, dynamic> json) {
    return RecipeModel(
      idMeal: json['idMeal'] ?? '',
      strMeal: json['strMeal'] ?? '',
      strCategory: json['strCategory'] ?? '',
      strArea: json['strArea'] ?? '',
      strMealThumb: json['strMealThumb'] ?? '',
    );
  }
}
