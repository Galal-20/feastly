class Ingredient {
  String name;
  String quantity;

  Ingredient({required this.name, required this.quantity});

  factory Ingredient.fromJson(Map<String, dynamic> json) => Ingredient(
        name: json['name'] as String,
        quantity: json['quantity'] as String,
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'quantity': quantity,
      };

  Ingredient copyWith({
    String? name,
    String? quantity,
  }) {
    return Ingredient(
      name: name ?? this.name,
      quantity: quantity ?? this.quantity,
    );
  }
}
