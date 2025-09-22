import 'package:flutter/material.dart';
import 'package:food/controller/cart_controller.dart';
import 'package:food/controller/resturant_controller.dart';
import 'package:food/controller/trace_record_controller.dart';
import 'package:food/screens/congratulation_screen.dart';

import 'package:get/get.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(CartController());
  Get.put(RestaurantController());
  Get.put(TraceRecordController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,

      home: Scaffold(body: Congratulation()),
    );
  }
}
