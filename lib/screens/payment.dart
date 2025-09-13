import 'package:flutter/material.dart';
import 'package:food/controller/cart_controller.dart';
import 'package:food/models/payment_card.dart';
import 'package:food/screens/Homescreen.dart';
import 'package:food/screens/congratulation.dart';
import 'package:food/utils/Colorutil.dart';
import 'package:food/widgets/button.dart';
import 'package:food/widgets/iconbtn.dart';
import 'package:food/widgets/paymentoption.dart';
import 'package:get/get.dart';

class Payment extends StatefulWidget {
  const Payment({super.key});

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  String? selectedOption;

  @override
  Widget build(BuildContext context) {
    final CartController cartController = Get.find();

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
                        Get.to(() => const Homescreen());
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
                          setState(() {
                            selectedOption = PaymentCard.option[index].item;
                          });
                        },
                      );
                    },
                  ),
                ),

                const SizedBox(height: 40),

                if (selectedOption != null) ...[
                  Text(
                    "Selected: $selectedOption",
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 10),
                ],

                Text(
                  'Total : ${cartController.totalPrice.toString()}',
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 20),

                Button(
                  color: Colorutil.color,
                  text: 'CONFIRM AND CONTINUE',
                  action: () {
                    if (selectedOption == null) {
                      Get.snackbar(
                        "Error",
                        "Please select a payment option first",
                      );
                    } else {
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
