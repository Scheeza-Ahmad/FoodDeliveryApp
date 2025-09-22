import 'dart:async';
import 'package:get/get.dart';

class TraceRecordController extends GetxController {
  var activeStage = 0.obs;
  Timer? timer;

  final List<String> stages = [
    'assets/images/confirmed.png',
    'assets/images/packed.png',
    'assets/images/dispatched.png',
    'assets/images/received.png',
  ];

  @override
  void onInit() {
    super.onInit();

    // Pehla stage 2 sec baad active hoga
    Future.delayed(const Duration(seconds: 2), () {
      activeStage.value = 1;

      // Baaki har 10 min baad next stage activate hoga
      int index = 2;
      timer = Timer.periodic(const Duration(seconds: 8), (t) {
        if (index <= stages.length) {
          activeStage.value = index;
          index++;
        } else {
          timer?.cancel();
        }
      });
    });
  }

  @override
  void onClose() {
    timer?.cancel();
    super.onClose();
  }
}
