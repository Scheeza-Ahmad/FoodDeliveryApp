import 'package:flutter/material.dart';
import 'package:food/controller/cart_controller.dart';
import 'package:food/controller/onboarding_controller.dart';
import 'package:food/controller/payment_controller.dart';
import 'package:food/controller/resturant_controller.dart';
import 'package:food/controller/trace_record_controller.dart';
import 'package:food/screens/firstsplash_screen.dart';
import 'package:food/screens/home_screen.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final pref = await SharedPreferences.getInstance();
  bool isLoggedIn = pref.getBool("isLoggedIn") ?? false;

  Get.put(OnboardingController());
  Get.put(CartController());
  Get.put(RestaurantController());
  Get.put(TraceRecordController());
  Get.put(PaymentController());

  runApp(MyApp(isLoggedIn: isLoggedIn));
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;
  const MyApp({super.key, required this.isLoggedIn});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: isLoggedIn ? Homescreen() : Firstsplashscreen(),
    );
  }
}
