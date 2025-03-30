
import 'package:flutter/material.dart';

class ShimmerContent extends StatelessWidget {
  const ShimmerContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 205,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Container(
              height: 90,
              width: double.infinity,
              color: Colors.grey[300], // Image placeholder
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 16,
                  width: 150,
                  color: Colors.grey[300], // Name placeholder
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Container(
                      height: 14,
                      width: 80,
                      color: Colors.grey[300], // Ingredients placeholder
                    ),
                    const SizedBox(width: 10),
                    Container(
                      height: 14,
                      width: 50,
                      color: Colors.grey[300], // Time placeholder
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
