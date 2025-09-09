import 'package:flutter/material.dart';
import 'package:food/models/resturant_model.dart';
import 'package:food/utils/Colorutil.dart';
// import 'package:get/get.dart';

class Resturant extends StatelessWidget {
  final ResturantModel restu;

  const Resturant({super.key, required this.restu});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Get.to('');
        print('Resturant is clicked');
      },
      child: SizedBox(
        height: 420,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                restu.image,
                height: 300,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              restu.name,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
            Text(
              restu.category,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Icon(Icons.star, color: Colorutil.color, size: 16),
                Text(
                  restu.rating.toString(),
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 10),
                Icon(Icons.delivery_dining, color: Colorutil.color, size: 16),
                Text(restu.delivery, style: const TextStyle(fontSize: 12)),
                const SizedBox(width: 10),
                Icon(Icons.timer, color: Colorutil.color, size: 16),
                Text(restu.time, style: const TextStyle(fontSize: 12)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
