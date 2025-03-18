import 'package:flutter/material.dart';

Widget recipeCard(String title, String category, String ingredients,
    String time, bool isFavorite) {
  return Card(
    color: Colors.white,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    elevation: 2,
    child: Padding(
      padding: EdgeInsets.all(10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(70),
              child: Image(
                image: AssetImage("assets/images/dish1.png"),
                width: 110,
                height: 110,
                fit: BoxFit.cover,
              )),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (category.isNotEmpty)
                  Text(
                    category,
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                Text(
                  title,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4),
                Text(
                  "$ingredients ",
                  style: TextStyle(color: Colors.black54, fontSize: 14),
                ),
                Text(
                  "$time ",
                  style: TextStyle(color: Colors.black54, fontSize: 14),
                ),
                SizedBox(height: 4),
                Row(
                  children: List.generate(
                      5,
                      (index) =>
                          Icon(Icons.star, color: Colors.yellow, size: 16)),
                ),
              ],
            ),
          ),
          Icon(
            isFavorite ? Icons.favorite : Icons.favorite_border,
            color: isFavorite ? Colors.black : Colors.grey,
          ),
        ],
      ),
    ),
  );
}
