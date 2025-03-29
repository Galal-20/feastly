# Home screen Feature Documentation

## Overview

The **Trending Recipes & Recommended for you feature** displays a list of meals.the request is sent to **Google Gemini AI** using a custom prompt. The AI processes the input and returns a list of **recommended food dishes** along with relevant information about the dish. Once the food details are received, an **image API** is used to fetch an image of the suggested dish.



---

## **Project Structure** (Following Clean Architecture)

```plaintext
lib/
│── core/
│   ├── app_router/
│   │   ├── app_router.dart
│   ├── components/
│   │   ├── recipe_card.dart
│   │   ├── recommended_card.dart
│   │   
│   │  
│   ├── error/
│   │   ├── failures.dart
│   ├── functions/
│   ├
│   ├── DI/
│   │   ├── service_locator.dart
│   ├
│   ├── network/
│   │   ├── pixabay_api.dart
│   ├── Theme/
│   │   ├── AppTheme.dart
│   ├── constants/
│   │   ├── colors.dart
│   │   ├── strings.dart
│   │   ├── images.dart
│   ├── utils/
│   │   ├── app_animations.dart
│   │   ├── app_text_styles.dart
│   │   ├── constants.dart
│   │   ├── size_config.dart
│── features/ai_chat/
│   ├── domain/
│   │   ├── entities/
│   │   │   ├── image_entity.dart
│   │   │   ├── recommended_for_you_entity.dart
│   │   │   ├── trending_recipes_entity.dart

│   │   ├── repositories/
│   │   │   ├── recommended_for_you_repo.dart
│   │   │   ├── trending_recipes_repo.dart
│   │   │   ├── get_image_repo.dart
│   │   ├── use_cases/
│   │   │   ├── recommended_for_you_use_case.dart
│   │   │   ├── trending_recipes_use_case.dart
│   │   │   ├── get_image_use_case.dart
│   │
│   ├── data/
│   │   ├── data_sources/
│   │   │   ├── image_remote_data_source.dart
│   │   │   ├── trending_recipes_remote_data_source.dart
│   │   │   ├── recommended_for_you_remote_data_source.dart
│   │   ├── models/
│   │   │   ├── trending_recipes_model.dart
│   │   │   ├──recommended_for_you_model.dart

│   │   ├── repositoriesImpl/
│   │   │   ├── trending_recipes_repo_impl.dart
│   │   │   ├── recommended_for_you_repo_impl.dart
│   │   │   ├── get_image_repo_impl.dart
│   │
│   ├── presentation/
│   │   ├── views/
│   │   │   ├── home_screen.dart
│   │   ├── widgets/
│   │   │   ├── custom widgets to build views
│   │   ├── view_model/
│   │   │   ├── recommended_for_you_bloc.dart
│   │   │   ├── recommended_for_you_event.dart
│   │   │   ├── recommended_for_you_state.dart
│   │   │   ├── trending_recipes_bloc.dart
│   │   │   ├── trending_recipes_event.dart
│   │   │   ├── trending_recipes_state.dart
```

---

## **Features Implemented**

1. **Trending Meals:** Displays the most popular meals fetched from the Google Gemini AI API.
2. **Personalized Recommendations:** Provides meal suggestions tailored to the user's preferences.
3. **Dynamic Meal Information:** Each meal card includes details like ingredients, cooking time, and nutrition.
4. **High-Quality Meal Images:** AI-generated or API-fetched images enhance visual appeal.
5. **Error Handling:** Ensures smooth user experience by managing API failures effectively.

---

## **Home Screen Data Flow**

### 🔥 **Fetching Trending Meals**

1. The app requests trending meal data from the Google Gemini AI API.
2. The API returns a list of popular meals with details.
3. The UI dynamically updates to display trending meals in a horizontal scrollable list.

### 🌟 **Fetching Personalized Recommendations**

1. This request is sent to the Google Gemini AI API for personalized meal suggestions.
2. The API returns tailored meal options based on user preferences.
3. The recommended meals are displayed in a dedicated section on the home screen.

### 📷 **Fetching Meal Images**

1. Each meal’s name is sent to an **image API**.
2. The API returns a relevant high-quality image.
3. The image is displayed alongside the meal details in the UI.
4. If the image API fails, a default placeholder image is used.

### ⚠ **Error Handling**

- If **Trending Meals API** fails → Show a retry button with an error message.
- If **Recommendations API** fails → Display a fallback set of generic meal suggestions.
- If **Image API** fails → Show a placeholder image instead of a broken image link.

---

## **Example API Request & Response**

### **Trending Meals Request**
```json
{
  "query": "Trending meals"
}
```

### **Trending Meals Response**
```json
{
  "meals": [
    {
      "food_title": "Grilled Chicken Salad",
      "cooking_time": "25 minutes",
      "servings": "2",
      "summary": "A healthy mix of grilled chicken, fresh greens, and dressing.",
      "image_url": "https://example.com/grilled_chicken_salad.jpg"
    }
  ]
}
```



### ** Recommendations Response**
```json
{
  "recommended_meals": [
    {
      "food_title": "Salmon Avocado Bowl",
      "cooking_time": "15 minutes",
      "servings": "1",
      "summary": "A nutritious salmon and avocado dish packed with healthy fats.",
      "image_url": "https://example.com/salmon_avocado_bowl.jpg"
    }
  ]
}
```

---

## **Future Improvements**

- Enhance personalization by integrating user dietary restrictions.
- Allow users to save favorite meals and revisit recommendations.
- Introduce interactive filters for meal discovery (e.g., cuisine, time, diet).
- Implement voice-based meal search for hands-free experience.

---

## **Conclusion**

The **Home Screen** enhances the user experience by providing AI-powered meal recommendations and trending food choices. With **Google Gemini AI** and an image API, users receive high-quality meal suggestions tailored to their preferences, making meal selection effortless and enjoyable.

