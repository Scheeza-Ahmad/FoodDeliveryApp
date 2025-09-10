import 'package:flutter/material.dart';
import 'package:food/screens/fourthscreen.dart';
import 'package:food/utils/Colorutil.dart';
import 'package:food/widgets/screen_container.dart';
import 'package:get/get.dart';
class Thirdscreen extends StatelessWidget {
  const Thirdscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(40, 50, 40, 50),
          child: SingleChildScrollView(
            child: ScreenContainer(
              image: 'assets/images/s3.jpg',
              heading: 'Order from choosen chef',
              text:
                  'Get all your loved foods in one place.You just place the order we do the rest',
              btntext: 'Next',
              action: () {
                Get.to(()=>Fourthscreen());
              },
              color: Colorutil.color,
              secondbtn: Colors.grey.shade600,
              secondbtntext: 'Skip',
            ),
          ),
        ),
      ),
    );
  }
}