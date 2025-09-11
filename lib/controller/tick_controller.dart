import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class TickController extends GetxController {
  var tick = true.obs;
  void toogle() {
    tick.value = !tick.value;
  }
}
