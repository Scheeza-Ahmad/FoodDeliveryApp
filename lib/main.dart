import 'package:flutter/material.dart';
import 'package:food/controller/cart_controller.dart';
import 'package:food/screens/rose_garden_resturant_screen.dart';
import 'package:get/get.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(CartController());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,

      home: Scaffold(body: RoseGardenResturantScreen()),
    );
  }
}
