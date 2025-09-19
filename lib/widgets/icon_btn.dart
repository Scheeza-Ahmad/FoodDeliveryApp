import 'package:flutter/material.dart';

class Iconbtn extends StatelessWidget {
  final Color color;
  final VoidCallback action;
  final IconData icon;
  const Iconbtn({
    super.key,
    required this.color,
    required this.action,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: action,
      child: CircleAvatar(
        radius: 20,
        backgroundColor: color,
        child: Icon(icon, size: 20, color: Colors.white),
      ),
    );
  }
}
