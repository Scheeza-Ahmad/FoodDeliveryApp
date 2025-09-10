import 'package:flutter/material.dart';
import 'package:food/models/payment_card.dart';
import 'package:food/screens/Homescreen.dart';
import 'package:food/screens/congratulation.dart';
import 'package:food/utils/Colorutil.dart';
import 'package:food/widgets/button.dart';
import 'package:food/widgets/iconbtn.dart';
import 'package:food/widgets/mastercard.dart';
import 'package:food/widgets/paymentoption.dart';
import 'package:get/get.dart';

class Payment extends StatelessWidget {
  const Payment({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Iconbtn(
                        color: Colors.grey.shade600,
                        action: () {
                          Get.to(() => Homescreen());
                        },
                        icon: Icons.arrow_back,
                      ),
                      SizedBox(width: 10),
                      Text(
                        'Payment',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 30),
              SizedBox(
                height: 200,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: PaymentCard.option.length,
                  itemBuilder: (context, index) {
                    return Paymentoption(pay: PaymentCard.option[index]);
                  },
                ),
              ),
              SizedBox(height: 20),
              Mastercard(),
              SizedBox(height: 20),
              Button(
                color: Colors.grey.shade300,
                text: '+ ADD NEW',
                action: () {
                  Get.to('');
                  print('New Card added');
                },
              ),
              SizedBox(height: 40),
              Text(
                'Total  ',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              Button(
                color: Colorutil.color,
                text: 'PAY AND CONFIRM',
                action: () {
                  Get.to(() => Congratulation());
                },
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
