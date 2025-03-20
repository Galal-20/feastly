import '../../../../core/network/retrofit.dart';
import '../../../mealDetails/data/models/meal_response.dart';

class SearchUseCase {
  final RetrofitServices retrofitServices;

  SearchUseCase(this.retrofitServices);

  Future<MealResponse> search(String query, String filter) {
    switch (filter) {
      case "Categories":
        return retrofitServices.searchByCategory(query);
      case "Ingredients":
        return retrofitServices.searchByIngredient(query);
      case "Countries":
        return retrofitServices.searchByCountry(query);
      default:
        return retrofitServices.searchByName(query);
    }
  }
}
