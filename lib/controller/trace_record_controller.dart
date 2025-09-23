import 'dart:async';
import 'package:food/utils/asset_util.dart';
import 'package:get/get.dart';

class TraceRecordController extends GetxController {
  var activeStage = 0.obs;
  Timer? timer;

  final List<String> stages = [
    AssetUtil.confirmed,
    AssetUtil.packed,
    AssetUtil.dispatched,
    AssetUtil.recieved,
  ];

  void startTrace() {
    activeStage.value = 0; // reset
    timer?.cancel();

    Future.delayed(const Duration(seconds: 2), () {
      activeStage.value = 1;

      int index = 2;
      timer = Timer.periodic(const Duration(seconds: 8), (t) {
        if (index < stages.length) {
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
