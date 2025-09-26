import 'package:flutter/material.dart';
import 'package:food/screens/third_screen.dart';
import 'package:food/utils/asset_util.dart';
import 'package:food/utils/color_util.dart';
import 'package:food/widgets/screen_container.dart';
import 'package:get/get.dart';

class Secondscreen extends StatelessWidget {
  const Secondscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(40, 50, 40, 50),
            child: SingleChildScrollView(
              child: ScreenContainer(
                image: AssetUtil.secondscreen,
                heading: 'All your Favourites',
                text:
                    'Get all your loved foods in one place.You just place the order we do the rest',
                btntext: 'Next',
                action: () {
                  Get.offAll(() => Thirdscreen());
                },
                color: Colorutil.color,
                secondbtn: Colors.grey.shade600,
                secondbtntext: 'Skip',
              ),
            ),
          ),
        ),
      ),
    );
  }
}
