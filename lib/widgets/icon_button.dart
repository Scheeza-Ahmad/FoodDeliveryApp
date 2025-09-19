import 'package:flutter/material.dart';

class Iconbutton extends StatelessWidget {
  final Color color;
  final VoidCallback action;
  final String image;
  const Iconbutton({
    super.key,
    required this.color,
    required this.action,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: action,
      child: CircleAvatar(
        radius: 20,
        backgroundColor: color,
        child: ClipOval(
          child: Image.asset(
            image,
            fit: BoxFit.contain, 
            width: 24,
            height: 24,
          ),
        ),
      ),
    );
  }
}
