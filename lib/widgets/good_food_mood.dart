import 'package:flutter/material.dart';

class GoodFoodMood extends StatelessWidget {
  const GoodFoodMood({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        RichText(
          text: const TextSpan(
            children: [
              TextSpan(
                text: 'Good',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 32,
                  fontWeight: FontWeight.w900,
                ),
              ),
              TextSpan(
                text: ' Food',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        RichText(
          text: const TextSpan(
            children: [
              TextSpan(
                text: 'Good',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.w900,
                ),
              ),
              TextSpan(
                text: ' Mood.',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 32,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
