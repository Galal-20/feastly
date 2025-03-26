import 'package:feastly/src/features/home/domain/entities/trending_recipes_section/ingredient_entity.dart';

class Ingredient extends IngredientEntity {
  Ingredient({required super.name, required super.quantity});

  factory Ingredient.fromMap(Map<String, dynamic> map) {
    return Ingredient(
      name: map["name"] as String,
      quantity: map["quantity"] as String,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "quantity": quantity,
    };
  }
}
