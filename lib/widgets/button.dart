import 'package:flutter/material.dart';
import 'package:food/utils/string_util.dart';

class Button extends StatelessWidget {
  final double width;
  final double height;
  final String text;
  final VoidCallback action;
  final Color color;

  const Button({
    super.key,
    this.width = double.infinity,
    this.height = 40,
    required this.color,
    required this.text,
    required this.action,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: action,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: color,
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontSize: Stringutil.mainsize,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
