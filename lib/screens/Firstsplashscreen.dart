import 'package:flutter/material.dart';
import 'package:food/screens/Loginscreen.dart';
import 'package:food/widgets/Logo.dart';
import 'package:get/get.dart';

class Firstsplashscreen extends StatelessWidget {
  const Firstsplashscreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      Get.off(() => const Loginscreen());
    });

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(child: Logo()),
    );
  }
}
