import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:food/controller/onboarding_controller.dart';
import 'package:food/screens/login_screen.dart';
import 'package:food/screens/home_screen.dart';
import 'package:food/utils/asset_util.dart';
import 'package:food/utils/color_util.dart';
import 'package:food/widgets/screen_container.dart';
import 'package:food/widgets/delivery_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingScreen extends StatelessWidget {
  OnboardingScreen({super.key});

  final OnboardingController c = Get.put(OnboardingController());

  @override
  Widget build(BuildContext context) {
    final pages = [
      ScreenContainer(
        image: AssetUtil.secondscreen,
        heading: 'All your Favourites',
        text:
            'Get all your loved foods in one place. You just place the order, we do the rest',
        btntext: 'Next',
        action: c.nextPage,
        color: Colorutil.color,
        secondbtn: Colors.grey.shade600,
        secondbtntext: 'Skip',
      ),
      ScreenContainer(
        image: AssetUtil.thirdscreen,
        heading: 'Order from chosen chef',
        text:
            'Get all your loved foods in one place. You just place the order, we do the rest',
        btntext: 'Next',
        action: c.nextPage,
        color: Colorutil.color,
        secondbtn: Colors.grey.shade600,
        secondbtntext: 'Skip',
      ),
      Deliverypage(
        image: AssetUtil.fourthscreen,
        heading: 'Free delivery offers',
        text:
            'Get all your loved foods in one place. You just place the order, we do the rest',
        btntext: 'Get Started',
        action: () async {
          final pref = await SharedPreferences.getInstance();
          bool isLoggedIn = pref.getBool("isLoggedIn") ?? false;

          if (isLoggedIn) {
            Get.offAll(() => Homescreen()); // ✅ Direct home agar login hai
          } else {
            Get.offAll(() => const Loginscreen()); // ✅ else login page
          }
        },
        color: Colorutil.color,
      ),
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: c.pageController,
                itemCount: pages.length,
                onPageChanged: (index) => c.pageIndex.value = index,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.fromLTRB(40, 50, 40, 50),
                  child: SingleChildScrollView(child: pages[index]),
                ),
              ),
            ),

            Obx(
              () => Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(pages.length, (index) {
                  final isActive = c.pageIndex.value == index;
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    margin: const EdgeInsets.symmetric(
                      horizontal: 4,
                      vertical: 12,
                    ),
                    width: isActive ? 16 : 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: isActive ? Colorutil.color : Colors.grey,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
