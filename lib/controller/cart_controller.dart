import 'package:get/get.dart';
import 'package:food/models/base_product.dart'; 

class CartController extends GetxController {
  var cartItems = <BaseProduct>[].obs;

  void addToCart(BaseProduct product) {
    cartItems.add(product);
  }

  void removeFromCart(BaseProduct product) {
    cartItems.remove(product);
  }

  void clearCart() {
    cartItems.clear();
  }

  double get totalPrice =>
      cartItems.fold(0, (sum, item) => sum + item.price);
}
