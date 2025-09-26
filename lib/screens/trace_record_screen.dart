import 'package:flutter/material.dart';
import 'package:food/screens/home_screen.dart';
import 'package:food/utils/asset_util.dart';
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
        backgroundColor: Colors.white,

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
                          Get.offAll(() => Homescreen());
                        },
                        icon: Icons.home,
                      ),
                    ],
                  ),
                  Lottie.asset(
                    AssetUtil.delivery,
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
                            bool isActive = i <= controller.activeStage.value;

                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12.0,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Stack(
                                    alignment: Alignment.topRight,
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.all(4),
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                            color: isActive
                                                ? Colors.green
                                                : Colors.grey,
                                            width: isActive ? 3 : 1,
                                          ),
                                        ),
                                        child: CircularImage(
                                          image: controller.stages[i],
                                          isActive: isActive,
                                        ),
                                      ),
                                      // 👇 Timer corner
                                      if (isActive &&
                                          i == controller.activeStage.value)
                                        Positioned(
                                          right: 0,
                                          top: 0,
                                          child: Obx(
                                            () => Container(
                                              padding: const EdgeInsets.all(4),
                                              decoration: const BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Colors.red,
                                              ),
                                              child: Text(
                                                "${controller.countdown.value}",
                                                style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    stageLabels[i],
                                    style: TextStyle(
                                      color: isActive
                                          ? Colors.green.shade800
                                          : Colors.black54,
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
