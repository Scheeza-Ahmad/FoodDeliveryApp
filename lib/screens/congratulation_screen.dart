import 'package:flutter/material.dart';
import 'package:food/screens/home_screen.dart';
import 'package:food/screens/trace_record_screen.dart';
import 'package:food/utils/color_util.dart';
import 'package:food/widgets/last_screen.dart';
import 'package:get/get.dart';

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
                secondaction: () {
                  Get.to(() => TraceRecordScreen());
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
