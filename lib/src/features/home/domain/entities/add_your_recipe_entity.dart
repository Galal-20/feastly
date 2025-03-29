class AddYourRecipeEntity {
  final dynamic mealImage;
  final String mealType;
  final String mealName;
  final String ingrediantsNo;
  final String cookingTime;
  final String summary;
  final String protine;
  final String carb;
  final String fats;
  final String kcal;
  final String vitamins;
  final String ingredinat1;
  final String piece1;
  final String ingredinat2;
  final String piece2;
  final String ingredinat3;
  final String piece3;
  final String ingredinat4;
  final String piece4;
  final String steps;
  final String? docID;

  AddYourRecipeEntity({
     this.docID,
    required this.mealImage,
    required this.mealType,
    required this.mealName,
    required this.ingrediantsNo,
    required this.cookingTime,
    required this.summary,
    required this.protine,
    required this.carb,
    required this.fats,
    required this.kcal,
    required this.vitamins,
    required this.ingredinat1,
    required this.piece1,
    required this.ingredinat2,
    required this.piece2,
    required this.ingredinat3,
    required this.piece3,
    required this.ingredinat4,
    required this.piece4,
    required this.steps,
  });
}
