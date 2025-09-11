import 'package:get/get.dart';

class EyeController extends GetxController {
  var obsecuretext = true.obs;
  void toogle() {
    obsecuretext.value = !obsecuretext.value;
  }
}
