import 'package:get/get.dart';
import 'package:food/models/base_product.dart';

class ResturantMenuController extends GetxController {
  final List<BaseProduct> allItems;
  var filteredItems = <BaseProduct>[].obs;

  ResturantMenuController(this.allItems);

  @override
  void onInit() {
    super.onInit();
    filteredItems.assignAll(allItems);
  }

  void updateSearch(String query) {
    if (query.isEmpty) {
      filteredItems.assignAll(allItems);
    } else {
      filteredItems.assignAll(
        allItems.where(
          (item) => item.name.toLowerCase().contains(query.toLowerCase()),
        ),
      );
    }
  }
}
