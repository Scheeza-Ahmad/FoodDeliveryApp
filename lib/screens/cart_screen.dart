import 'package:flutter/material.dart';
import 'package:food/controller/cart_controller.dart';
import 'package:food/screens/home_screen.dart';
import 'package:food/screens/payment_screen.dart';
import 'package:food/utils/color_util.dart';
import 'package:food/widgets/button.dart';
import 'package:food/widgets/icon_btn.dart';
import 'package:food/widgets/input_field.dart';
import 'package:get/get.dart';

class Cartscreen extends StatelessWidget {
  const Cartscreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController addressController = TextEditingController();
    final CartController cartController = Get.find();

    return SafeArea(
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },

        child: Scaffold(
          backgroundColor: Colors.white,
          body: Container(
            color: const Color(0xff121223),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Iconbtn(
                            color: Colors.grey.shade600,
                            action: () => Get.back(),
                            icon: Icons.arrow_back,
                          ),
                          const SizedBox(width: 10),
                          const Text(
                            'Cart',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                      InkWell(
                        onTap: () => Get.offAll(() => Homescreen()),
                        child: const Text(
                          'Continue Shopping',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.green,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Expanded(
                    child: Obx(
                      () => ListView.separated(
                        itemCount: cartController.cartItems.length,
                        separatorBuilder: (context, index) =>
                            Divider(color: Colors.grey.shade300, thickness: 1),
                        itemBuilder: (context, index) {
                          var entry = cartController.cartItems.entries
                              .toList()[index];
                          var item = entry.key;
                          var quantity = entry.value;

                          return ListTile(
                            leading: Image.asset(
                              item.image,
                              width: 50,
                              height: 50,
                              fit: BoxFit.cover,
                            ),
                            title: Text(
                              item.name,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                            subtitle: Text(
                              "PKR ${item.price * quantity} (x$quantity)",
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  icon: const Icon(
                                    Icons.remove_circle,
                                    color: Colors.red,
                                  ),
                                  onPressed: () =>
                                      cartController.removeFromCart(item),
                                ),
                                Text(
                                  "$quantity",
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                IconButton(
                                  icon: const Icon(
                                    Icons.add_circle,
                                    color: Colors.green,
                                  ),
                                  onPressed: () =>
                                      cartController.addToCart(item),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          bottomNavigationBar: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.fromLTRB(18, 14, 18, 14),
              height: 260,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Delivery Address',
                    style: TextStyle(fontSize: 17, color: Colors.grey.shade500),
                  ),
                  const SizedBox(height: 15),
                  Inputfield(
                    cont: addressController,
                    type: TextInputType.text,
                    hint: '114, Allama Iqbal Town',
                    option: false,
                  ),
                  const SizedBox(height: 30),
                  Row(
                    children: [
                      const Text(
                        'Price',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Obx(
                        () => Text(
                          "PKR ${cartController.totalPrice}",
                          style: TextStyle(
                            color: Colors.grey.shade500,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Button(
                    color: Colorutil.color,
                    text: 'PLACE ORDER',
                    action: () {
                      if (cartController.cartItems.isEmpty) {
                        Get.dialog(
                          AlertDialog(
                            title: const Text("Cart is Empty"),
                            content: const Text(
                              "Please add some items before placing the order.",
                            ),
                            actions: [
                              TextButton(
                                onPressed: () => Get.back(),
                                child: const Text("OK"),
                              ),
                            ],
                          ),
                        );
                      } else if (addressController.text.trim().isEmpty) {
                        Get.dialog(
                          AlertDialog(
                            title: const Text("Address Required"),
                            content: const Text(
                              "Please enter your delivery address before placing the order.",
                            ),
                            actions: [
                              TextButton(
                                onPressed: () => Get.back(),
                                child: const Text("OK"),
                              ),
                            ],
                          ),
                        );
                      } else {
                        Get.off(() => const Payment());
                      }
                    },
                    height: 50,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
