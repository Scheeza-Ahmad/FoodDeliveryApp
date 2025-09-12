import 'package:flutter/material.dart';
import 'package:food/screens/Loginscreen.dart';
import 'package:food/utils/Colorutil.dart';
import 'package:food/widgets/deliverypage.dart';
import 'package:get/get.dart';

class Fourthscreen extends StatelessWidget {
  const Fourthscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(40, 50, 40, 50),
            child: SingleChildScrollView(
              child: Deliverypage(
                image: 'assets/images/s4.jpg',
                heading: 'Free delivery offers',
                text:
                    'Get all your loved foods in one place. You just place the order, we do the rest',
                btntext: 'Get Started',
                action: () {
                  Get.to(() => Loginscreen());
                },
                color: Colorutil.color,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
