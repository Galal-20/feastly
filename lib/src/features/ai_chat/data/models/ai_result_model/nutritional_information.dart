class NutritionalInformation {
  String protein;
  String carbs;
  String fats;
  String vitamins;
  String kcal;

  NutritionalInformation({
    required this.protein,
    required this.carbs,
    required this.fats,
    required this.vitamins,
    required this.kcal,
  });

  factory NutritionalInformation.fromJson(Map<String, dynamic> json) {
    return NutritionalInformation(
      protein: json['protein'] as String,
      carbs: json['carbs'] as String,
      fats: json['fats'] as String,
      vitamins: json['vitamins'] as String,
      kcal: json['kcal'] as String,
    );
  }

  Map<String, dynamic> toJson() => {
        'protein': protein,
        'carbs': carbs,
        'fats': fats,
        'vitamins': vitamins,
        'kcal': kcal,
      };

  NutritionalInformation copyWith({
    String? protein,
    String? carbs,
    String? fats,
    String? vitamins,
    String? kcal,
  }) {
    return NutritionalInformation(
      protein: protein ?? this.protein,
      carbs: carbs ?? this.carbs,
      fats: fats ?? this.fats,
      vitamins: vitamins ?? this.vitamins,
      kcal: kcal ?? this.kcal,
    );
  }
}
