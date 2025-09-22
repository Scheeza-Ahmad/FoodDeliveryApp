import 'package:flutter/material.dart';
import 'package:food/controller/cart_controller.dart';
import 'package:food/screens/firstsplash_screen.dart';

import 'package:get/get.dart';

void main() async {
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

      home: Scaffold(body: Firstsplashscreen()),
    );
  }
}
