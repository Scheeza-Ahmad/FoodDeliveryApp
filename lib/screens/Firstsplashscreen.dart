import 'package:flutter/material.dart';
import 'package:food/screens/Secondscreen.dart';
import 'package:food/widgets/Logo.dart';
import 'package:get/get.dart';

class Firstsplashscreen extends StatelessWidget {
  const Firstsplashscreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      Get.off(() => const Secondscreen());
    });

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(child: Logo()),
      ),
    );
  }
}
