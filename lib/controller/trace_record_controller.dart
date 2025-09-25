import 'dart:async';
import 'package:food/utils/asset_util.dart';
import 'package:get/get.dart';

class TraceRecordController extends GetxController {
  var activeStage = 0.obs;
  var countdown = 0.obs; // 👈 countdown timer
  Timer? timer;
  Timer? countdownTimer;

  final List<String> stages = [
    AssetUtil.confirmed,
    AssetUtil.packed,
    AssetUtil.dispatched,
    AssetUtil.recieved,
  ];

  void startTrace() {
    activeStage.value = 0; // reset
    timer?.cancel();
    countdownTimer?.cancel();

    Future.delayed(const Duration(seconds: 2), () {
      activeStage.value = 1;
      _startCountdown(8); // 👈 har stage ka countdown start

      int index = 2;
      timer = Timer.periodic(const Duration(seconds: 8), (t) {
        if (index < stages.length) {
          activeStage.value = index;
          _startCountdown(8); // 👈 naya countdown start
          index++;
        } else {
          timer?.cancel();
          countdownTimer?.cancel();
        }
      });
    });
  }

  void _startCountdown(int seconds) {
    countdown.value = seconds;
    countdownTimer?.cancel();
    countdownTimer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (countdown.value > 0) {
        countdown.value--;
      } else {
        countdownTimer?.cancel();
      }
    });
  }

  @override
  void onClose() {
    timer?.cancel();
    countdownTimer?.cancel();
    super.onClose();
  }
}
