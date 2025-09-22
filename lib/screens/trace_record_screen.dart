import 'package:flutter/material.dart';
import 'package:food/screens/home_screen.dart';
import 'package:food/utils/string_util.dart';
import 'package:food/widgets/circular_image.dart';
import 'package:food/widgets/icon_btn.dart';
import 'package:food/widgets/rating_button.dart';
import 'package:get/get.dart';
import 'package:food/controller/trace_record_controller.dart';
import 'package:lottie/lottie.dart';

class TraceRecordScreen extends StatelessWidget {
  TraceRecordScreen({super.key});

  final TraceRecordController controller = Get.find();

  final List<String> stageLabels = [
    "Order Confirmed",
    "Order Packed",
    "Order Dispatched",
    "Order Received",
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Iconbtn(
                        color: Colors.grey.shade700,
                        action: () {
                          Get.back();
                        },
                        icon: Icons.arrow_back,
                      ),
                      Iconbtn(
                        color: Colors.grey.shade700,
                        action: () {
                          Get.to(() => Homescreen());
                        },
                        icon: Icons.home,
                      ),
                    ],
                  ),
                  Lottie.asset(
                    'assets/animations/delivery.json',
                    width: 600,
                    fit: BoxFit.cover,
                  ),
                  Text(
                    'Trace Order',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: Stringutil.headingsize,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ],
              ),
            ),

            Expanded(
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(158, 235, 229, 229),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Column(
                  children: [
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.all(16),
                      child: Obx(() {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(controller.stages.length, (
                            i,
                          ) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12.0,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  CircularImage(
                                    image: controller.stages[i],
                                    isActive: i < controller.activeStage.value,
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    stageLabels[i],
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }),
                        );
                      }),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: RatingDialog(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
