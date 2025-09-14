import 'package:flutter/material.dart';
import 'package:food/screens/Homescreen.dart';
import 'package:food/utils/Colorutil.dart';
import 'package:food/widgets/last_screen.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class Congratulation extends StatelessWidget {
  const Congratulation({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(40, 50, 40, 50),
            child: SingleChildScrollView(
              child: LastScreen(
                image: 'assets/images/congrat.jpg',
                heading: 'Congratulations!!',
                text: 'Your Order Is Placed Successfully!!!',
                btntext: 'CONTINUE YOUR FOOD HUNT',
                action: () {
                  Get.to(() => Homescreen());
                },
                color: Colorutil.color,
                lasttext: 'You will recieve your order soon',
              ),
            ),
          ),
        ),
      ),
    );
  }
}
