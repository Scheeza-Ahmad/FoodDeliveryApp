import 'package:food/models/homepage_card.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  var cartItems = <HomepageCard>[].obs;

  void addToCart(HomepageCard product) {
    cartItems.add(product);
  }

  void removeFromCart(HomepageCard product) {
    cartItems.remove(product);
  }

  double get totalPrice =>
      cartItems.fold(0, (sum, item) => sum + item.price);
}
