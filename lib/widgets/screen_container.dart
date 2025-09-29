import 'package:flutter/material.dart';
import 'package:food/widgets/button.dart';

class ScreenContainer extends StatelessWidget {
  final String image;
  final String heading;
  final String text;
  final String btntext;
  final Color color;
  final Color secondbtn;
  final VoidCallback action;
  final String secondbtntext;

  const ScreenContainer({
    super.key,
    required this.image,
    required this.heading,
    required this.text,
    required this.btntext,
    required this.action,
    required this.color,
    required this.secondbtn,
    required this.secondbtntext,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // 🔹 Image with proper fit (blue line hatane ke liye)
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.asset(
            image,
            height: 300,
            width: double.infinity,
            fit: BoxFit.cover, // pura cover karega
          ),
        ),

        const SizedBox(height: 20),

        // 🔹 Heading
        Text(
          heading,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),

        const SizedBox(height: 12),

        // 🔹 Subtext
        Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.grey[600], fontSize: 14, height: 1.4),
        ),

        const SizedBox(height: 20),

        // 🔹 Primary Button
        Button(color: color, text: btntext, action: action, height: 60),

        const SizedBox(height: 12),

        // 🔹 Secondary Button
        Button(
          color: secondbtn,
          text: secondbtntext,
          action: action,
          height: 60,
        ),
      ],
    );
  }
}
