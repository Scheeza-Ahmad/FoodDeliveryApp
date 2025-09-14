import 'package:flutter/material.dart';
import 'package:food/widgets/button.dart';
import 'package:food/widgets/rating_button.dart';

class LastScreen extends StatelessWidget {
  final String image;
  final String heading;
  final String text;
  final String lasttext;
  final String btntext;

  final Color color;
  final VoidCallback action;

  const LastScreen({
    super.key,
    required this.image,
    required this.heading,
    required this.text,
    required this.btntext,
    required this.action,
    required this.color,
    required this.lasttext,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(image, height: 300),
        SizedBox(height: 20),
        Text(
          heading,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        SizedBox(height: 12),
        Text(text, style: TextStyle(color: Colors.grey[600], fontSize: 14)),
                SizedBox(height: 12),
        Text(lasttext, style: TextStyle(color: Colors.grey[600], fontSize: 14)),
        SizedBox(height: 22),
        RatingDialog(),
        SizedBox(height: 18,),
        Button(color: color, text: btntext, action: action, height: 60),
      ],
    );
  }
}
