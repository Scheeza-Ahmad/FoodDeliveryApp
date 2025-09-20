import 'package:flutter/material.dart';
import 'package:food/models/resturant_model.dart';
import 'package:food/screens/china_town_resturant_screen.dart';
import 'package:food/screens/continental_bites_resturant.dart';
import 'package:food/screens/crispy_chips_resturant_screen.dart';
import 'package:food/screens/desi_delight_resturant.dart';
import 'package:food/screens/layers_resturant_screen.dart';
import 'package:food/screens/pancake_house_screen.dart';
import 'package:food/screens/rose_garden_resturant_screen.dart';
import 'package:food/screens/sandwich_stop_screen.dart';
import 'package:food/utils/color_util.dart';
import 'package:get/route_manager.dart';

class Resturant extends StatelessWidget {
  final ResturantModel restu;

  const Resturant({super.key, required this.restu});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (restu.name == "Rose Garden Restaurant") {
          Get.to(() => const RoseGardenResturantScreen());
        } else if (restu.name == "Crispy Chips Corner") {
          Get.to(() => const CrispyChipsResturantScreen());
        } else if (restu.name == "Desi Delight") {
          Get.to(() => const DesiDelightResturant());
        } else if (restu.name == "Continental Bites") {
          Get.to(() => const ContinentalBitesResturant());
        } else if (restu.name == "Layers Bakery") {
          Get.to(() => const LayersResturantScreen());
        } else if (restu.name == "China Town") {
          Get.to(() => const ChinaTownResturantScreen());
        } else if (restu.name == "Pancake House") {
          Get.to(() => const PancakeHouseScreen());
        } else if (restu.name == "Sandwich Stop") {
          Get.to(() => const SandwichStopScreen());
        }
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
