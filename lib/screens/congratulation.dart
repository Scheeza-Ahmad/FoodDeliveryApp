import 'package:flutter/material.dart';
import 'package:food/screens/Homescreen.dart';
import 'package:food/utils/Colorutil.dart';
import 'package:food/widgets/deliverypage.dart';
import 'package:get/get.dart';

class Congratulation extends StatelessWidget {
  const Congratulation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(40, 50, 40, 50),
          child: SingleChildScrollView(
            child: Deliverypage(
              image: 'assets/images/congrat.jpg',
              heading: 'Congratulations!',
              text: 'You Successfully made a payment.Enjoy our services',
              btntext: 'TRACE ORDER',
              action: () {
                Get.to(() => Homescreen());
              },
              color: Colorutil.color,
            ),
          ),
        ),
      ),
    );
  }
}
