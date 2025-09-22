import 'package:flutter/material.dart';

class CircularImage extends StatelessWidget {
  final String image;
  final bool isActive;
  const CircularImage({
    super.key,
    required this.image,
    this.isActive = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: isActive ? Colors.green : Colors.grey.shade400,
          width: 4,
        ),
      ),
      child: CircleAvatar(
        radius: 50,
        backgroundColor: Colors.grey.shade200,
        backgroundImage: AssetImage(image),
      ),
    );
  }
}
