# AI Chat Feature Documentation

## Overview

The **AI Chat feature** allows users to enter ingredients into a text field. Upon submission, these ingredients are sent to **Google Gemini AI** using a custom prompt. The AI processes the input and returns a **recommended food dish** along with relevant information about the dish. Once the food details are received, an **image API** is used to fetch an image of the suggested dish.



---

## **Project Structure** (Following Clean Architecture)

```plaintext
lib/
│── core/
│   ├── app_router/
│   │   ├── app_router.dart
│   ├── components/
│   │   ├── custom_background_container.dart
│   │   ├── custom_button.dart
│   │   ├── custom_text_button.dart
│   │   ├── custom_text_form_field.dart
│   ├── error/
│   │   ├── failures.dart
│   ├── functions/
│   ├── helper/
│   │   ├── shared_prefrences.dart
│   ├── DI/
│   │   ├── service_locator.dart
│   ├── use_case/
│   │   ├── use_case.dart
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
│   │   │   ├── ai_chat_entity.dart
│   │   ├── repositories/
│   │   │   ├── ai_chat_repo.dart
│   │   │   ├── get_image_repo.dart
│   │   ├── use_cases/
│   │   │   ├── get_ai_chat_use_case.dart
│   │   │   ├── get_image_use_case.dart
│   │
│   ├── data/
│   │   ├── data_sources/
│   │   │   ├── image_remote_data_source.dart
│   │   │   ├── remote_data_source.dart
│   │   ├── models/
│   │   │   ├── ai_result_model.dart
│   │   │   ├── image_model.dart
│   │   ├── repositories/
│   │   │   ├── ai_chat_repo_impl.dart
│   │   │   ├── get_image_repo_impl.dart
│   │
│   ├── presentation/
│   │   ├── views/
│   │   │   ├── ai_chat_screen.dart
│   │   ├── widgets/
│   │   │   ├── custom widgets to build views
│   │   ├── view_model/
│   │   │   ├── ai_chat_bloc.dart
│   │   │   ├── ai_chat_event.dart
│   │   │   ├── ai_chat_state.dart
```

---

## **Features Implemented**

1. **Ingredient Input:** Users enter ingredients in a text field. 
2. **AI Processing:** Ingredients are sent to Google Gemini AI for food recommendations. 
3. **Food Details Display:** AI returns a recommended food dish with relevant information.  
4. **Food Image Retrieval:** The details are used to fetch an image of the dish.  
5. **Error Handling:** Handles API failures gracefully.


---

## **Food Recommendation Flow**

### 📝 **User Input Submission**

1. The user enters a list of ingredients.
2. The entered ingredients are passed to `AiChatBloc`.
3. `AiChatBloc` calls `GetFoodRecommendationUseCase`.
4. `GetFoodRecommendationUseCase` calls `AiChatRepo`.
5. `AiChatRepo` calls `AiChatRemoteDataSource`.
6. The Google Gemini AI processes the input and returns a recommended food dish with details.

### 📷 **Fetching Food Image**

1. Once food details are received, the name of the dish is sent to an **image API**.
2. The image API returns a relevant image.
3. The food details and image are displayed in the UI.

### ⚠ **Error Handling**

- If AI response fails → Show an error message.
- If image API fails → Show a placeholder image.

---

## **Example AI Request & Response**

### **Request Sent to AI**
```text
You are a meal recommendation assistant. Your task is to provide detailed information about a food item based on the user's input. The user will provide either the name of the food or a list of ingredients. You must respond in JSON format with the following structure:
Now, process the following user input:[user input]
```

### **AI Response**
```json
{

  "food_title": "Name of the food",

  "type_of_meat": "Type of meat used (if applicable, otherwise 'None')",

  "cooking_time": "Total cooking time in minutes",

  "servings": "Number of servings",

  "summary": "A brief description of the food",

  "image_url": "URL to an image of the food ,create the image and give me the url ",

  "nutritional_information": {

    "protein": "Amount of protein in grams",

    "carbs": "Amount of carbohydrates in grams",

    "fats": "Amount of fats in grams",

    "vitamins": "Key vitamins present",

    "kcal": "Total calories"

  },

  "ingredients": [

    {

      "name": "Ingredient name",

      "quantity": "Quantity of the ingredient"

    }

  ],

  "directions": [

    "Step 1: ...",

    "Step 2: ...",

    "Step 3: ..."

  ]

}

```

### **Image API Request**
```json
{
  "query": "Margherita Pizza"
}
```

### **Image API Response**
```json
{
  "image_url": "https://example.com/margherita_pizza.jpg"
}
```

---

## **Future Improvements**

- Allow users to refine AI suggestions.
- Enable multiple food suggestions per query.
- Add voice input support for ingredients.
- Enhance UI with more interactive elements.

---

## **Conclusion**

The **AI Chat** feature enhances user experience by providing intelligent food recommendations based on available ingredients. With **Google Gemini AI** and an image API, users can quickly get dish suggestions along with visuals, making cooking decisions easier and more enjoyable.

