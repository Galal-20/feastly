class RecipeEntity {
  final String idMeal;
  final String strMeal;
  final String strCategory;
  final String strArea;
  final String strMealThumb;

  RecipeEntity({
    required this.idMeal,
    required this.strMeal,
    required this.strCategory,
    required this.strArea,
    required this.strMealThumb,
  });

  @override
  int get hashCode =>
      idMeal.hashCode ^
      strMeal.hashCode ^
      strCategory.hashCode ^
      strArea.hashCode ^
      strMealThumb.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RecipeEntity &&
          runtimeType == other.runtimeType &&
          idMeal == other.idMeal &&
          strMeal == other.strMeal &&
          strCategory == other.strCategory &&
          strArea == other.strArea &&
          strMealThumb == other.strMealThumb;
}
