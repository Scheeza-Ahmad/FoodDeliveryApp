import 'package:get/get.dart';

class PaymentController extends GetxController {
  var selectedOption = "".obs;

  void selectOption(String option) {
    selectedOption.value = option;
  }

  bool get hasSelection => selectedOption.isNotEmpty;

  void clearSelection() {
    selectedOption.value = "";
  }
}
