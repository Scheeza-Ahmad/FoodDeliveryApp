import 'package:flutter/material.dart';
import 'package:food/screens/onboarding_screen.dart';
import 'package:food/screens/home_screen.dart';
import 'package:food/utils/asset_util.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Firstsplashscreen extends StatelessWidget {
  const Firstsplashscreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () async {
      final pref = await SharedPreferences.getInstance();
      bool isLoggedIn = pref.getBool("isLoggedIn") ?? false;

      if (isLoggedIn) {
        Get.offAll(() => Homescreen()); 
      } else {
        Get.offAll(() => OnboardingScreen()); 
      }
    });

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(child: Image.asset(AssetUtil.logo)),
      ),
    );
  }
}
