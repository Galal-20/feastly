// import '../../../../core/network/retrofit.dart';
// import '../../../mealDetails/data/models/meal_response.dart';
//
// class SearchUseCase {
//   final RetrofitServices retrofitServices;
//
//   SearchUseCase(this.retrofitServices);
//
//   Future<MealResponse> search(String query, String filter) {
//     switch (filter) {
//       case "Categories":
//         return retrofitServices.searchByCategory(query);
//       case "Ingredients":
//         return retrofitServices.searchByIngredient(query);
//       case "Countries":
//         return retrofitServices.searchByCountry(query);
//       default:
//         return retrofitServices.searchByName(query);
//     }
//   }
// }


import 'package:feastly/src/features/foodDetails/domain/entities/meal_entity.dart';

import '../repositories/RecipeRepository.dart';

class SearchUseCase {
  final RecipeRepository repository;

  SearchUseCase(this.repository);

  Future<List<MealEntity>> search(String query, String filter) async {
    return await repository.searchMeals(query);
  }
}
