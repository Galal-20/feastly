import 'package:feastly/src/features/foodDetails/domain/entities/meal_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'meal.g.dart';

@JsonSerializable()
class Meal extends MealEntity {
  @override
  final String idMeal;
  @override
  final String strMeal;
  @override
  final String? strCategory;
  @override
  final String? strArea;
  @override
  final String? strInstructions;
  @override
  final String? strMealThumb;
  @override
  final String? strTags;
  @override
  final String? strYoutube;
  @override
  final List<String> ingredients;
  @override
  final List<String> measures;

  Meal({
    required this.idMeal,
    required this.strMeal,
    this.strCategory,
    this.strArea,
    this.strInstructions,
    this.strMealThumb,
    this.strTags,
    this.strYoutube,
    List<String?>? ingredients,
    List<String?>? measures,
  })  : ingredients = _buildList(ingredients ?? List.filled(20, null)),
        measures = _buildList(measures ?? List.filled(20, null)),
        super(
          idMeal: idMeal,
          strMeal: strMeal,
          strCategory: strCategory ?? '',
          strArea: strArea ?? '',
          strInstructions: strInstructions ?? '',
          strMealThumb: strMealThumb ?? '',
          strTags: strTags ?? '',
          strYoutube: strYoutube ?? '',
          ingredients: _buildList(ingredients ?? List.filled(20, null)),
          measures: _buildList(measures ?? List.filled(20, null)),
        );

  factory Meal.fromJson(Map<String, dynamic> json) {
    final meal = _$MealFromJson(json);
    final ingredients = List<String?>.filled(20, null);
    final measures = List<String?>.filled(20, null);

    for (var i = 1; i <= 20; i++) {
      ingredients[i - 1] = json['strIngredient$i'];
      measures[i - 1] = json['strMeasure$i'];
    }

    return Meal(
      idMeal: meal.idMeal,
      strMeal: meal.strMeal,
      strCategory: meal.strCategory,
      strArea: meal.strArea,
      strInstructions: meal.strInstructions,
      strMealThumb: meal.strMealThumb,
      strTags: meal.strTags,
      strYoutube: meal.strYoutube,
      ingredients: ingredients,
      measures: measures,
    );
  }

  
  Map<String, dynamic> toJson() {
    final json = _$MealToJson(this);
    for (var i = 1; i <= 20; i++) {
      json['strIngredient$i'] = ingredients.length >= i ? ingredients[i - 1] : null;
      json['strMeasure$i'] = measures.length >= i ? measures[i - 1] : null;
    }

    return json;
  }

  static List<String> _buildList(List<String?> items) {
    return items.where((item) => item != null && item.trim().isNotEmpty).map((e) => e!).toList();
  }
}