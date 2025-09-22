import 'package:flutter/material.dart';
import 'package:food/controller/cart_controller.dart';
import 'package:food/controller/payment_controller.dart';
import 'package:food/models/payment_card.dart';
import 'package:food/screens/home_screen.dart';
import 'package:food/screens/congratulation_screen.dart';
import 'package:food/utils/color_util.dart';
import 'package:food/widgets/button.dart';
import 'package:food/widgets/icon_btn.dart';
import 'package:food/widgets/payment_option.dart';
import 'package:get/get.dart';

class Payment extends StatelessWidget {
  const Payment({super.key});

  @override
  Widget build(BuildContext context) {
    final CartController cartController = Get.find();
    final PaymentController paymentController = Get.put(PaymentController());

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 15),

                Row(
                  children: [
                    Iconbtn(
                      color: Colors.grey.shade600,
                      action: () {
                        Get.to(() => Homescreen());
                      },
                      icon: Icons.arrow_back,
                    ),
                    const SizedBox(width: 10),
                    const Text(
                      'Payment',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 30),

                SizedBox(
                  height: 200,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: PaymentCard.option.length,
                    itemBuilder: (context, index) {
                      return Paymentoption(
                        pay: PaymentCard.option[index],
                        onSelect: () {
                          paymentController.selectOption(
                            PaymentCard.option[index].item,
                          );
                        },
                      );
                    },
                  ),
                ),

                const SizedBox(height: 20),

                // Show selected option
                Obx(() {
                  if (paymentController.hasSelection) {
                    return Text(
                      "Selected: ${paymentController.selectedOption.value}",
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    );
                  }
                  return const SizedBox.shrink();
                }),

                const SizedBox(height: 20),

                Obx(
                  () => Text(
                    'Total : ${cartController.totalPrice}',
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                const SizedBox(height: 30),

                Button(
                  color: Colorutil.color,
                  text: 'CONFIRM AND CONTINUE',
                  action: () {
                    if (!paymentController.hasSelection) {
                      Get.snackbar(
                        "Error",
                        "Please select a payment option first",
                        snackPosition: SnackPosition.TOP,
                      );
                    } else {
                      cartController.clearCart();
                      paymentController.clearSelection();

                      Get.to(() => const Congratulation());
                    }
                  },
                  height: 50,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
