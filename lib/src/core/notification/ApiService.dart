import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static Future<Map<String, String>> fetchNotificationData() async {
    try {
      final response = await http.get(Uri.parse('https://www.themealdb.com/api/json/v1/1/random.php'));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        final meal = data["meals"][0];

        return {
          "title": meal["strMeal"] ?? "New Meal",
          "country": meal["strArea"] ?? "Unknown",
          "body": meal["strInstructions"]?.split('.').first ?? "Try this meal today!",
        };
      } else {
        return {"title": "Meal Not Found", "country": "Unknown", "body": "Could not fetch meal "
            "data."};
      }
    } catch (e) {
      return {"title": "Error", "body": "Something went wrong while fetching meal data."};
    }
  }
}
