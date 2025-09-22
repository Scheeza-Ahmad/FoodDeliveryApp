import 'package:get/get.dart';
import 'package:food/models/resturant_model.dart';

class RestaurantController extends GetxController {
  var searchQuery = "".obs;
  var filteredRestaurants = <ResturantModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    // Pehle se sari restaurants dikhao
    filteredRestaurants.assignAll(ResturantModel.resturant);

    // Jab bhi searchQuery change ho to filter karo
    ever(searchQuery, (_) => filterRestaurants());
  }

  void filterRestaurants() {
    if (searchQuery.isEmpty) {
      filteredRestaurants.assignAll(ResturantModel.resturant);
    } else {
      filteredRestaurants.assignAll(
        ResturantModel.resturant.where(
          (r) => r.name.toLowerCase().contains(searchQuery.value.toLowerCase()),
        ),
      );
    }
  }
}
