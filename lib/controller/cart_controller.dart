import 'package:get/get.dart';
import 'package:food/models/base_product.dart';

class CartController extends GetxController {
  var cartItems = <BaseProduct, int>{}.obs; // item + quantity map

  void addToCart(BaseProduct product) {
    if (cartItems.containsKey(product)) {
      cartItems[product] = cartItems[product]! + 1;
    } else {
      cartItems[product] = 1;
    }
  }

  void removeFromCart(BaseProduct product) {
    if (cartItems.containsKey(product) && cartItems[product]! > 1) {
      cartItems[product] = cartItems[product]! - 1;
    } else {
      cartItems.remove(product);
    }
  }

  void clearCart() {
    cartItems.clear();
  }

  double get totalPrice {
    double total = 0;
    cartItems.forEach((product, qty) {
      total += product.price * qty;
    });
    return total;
  }
}
