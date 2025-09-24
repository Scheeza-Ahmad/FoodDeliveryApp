import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingController extends GetxController {
  var pageIndex = 0.obs;
  late PageController pageController;

  @override
  void onInit() {
    super.onInit();
    pageController = PageController(initialPage: 0);
  }

  void nextPage() {
    if (pageIndex.value < 2) {
      pageController.animateToPage(
        pageIndex.value + 1,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void skipToLast() {
    pageController.jumpToPage(2);
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}
