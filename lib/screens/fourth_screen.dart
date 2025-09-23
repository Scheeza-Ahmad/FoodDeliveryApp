import 'package:flutter/material.dart';
import 'package:food/screens/login_screen.dart';
import 'package:food/utils/asset_util.dart';
import 'package:food/utils/color_util.dart';
import 'package:food/widgets/delivery_page.dart';
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
                image: AssetUtil.fourthscreen,
                heading: 'Free delivery offers',
                text:
                    'Get all your loved foods in one place. You just place the order, we do the rest',
                btntext: 'Get Started',
                action: () {
                  Get.offAll(() => Loginscreen());
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
