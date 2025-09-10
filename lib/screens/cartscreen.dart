import 'package:flutter/material.dart';
import 'package:food/screens/Homescreen.dart';
import 'package:food/screens/payment.dart';
import 'package:food/utils/Colorutil.dart';
import 'package:food/widgets/button.dart';
import 'package:food/widgets/iconbtn.dart';
import 'package:food/widgets/inputfield.dart';
import 'package:get/get.dart';

class Cartscreen extends StatelessWidget {
  const Cartscreen({super.key});

  @override
  Widget build(BuildContext context) {
    final searchcontroller = TextEditingController();
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            color: Color(0xff121223),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
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
                        onTap: () {
                          Get.to(() => Payment());
                        },
                        child: Text(
                          'DONE',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.green,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              width: double.infinity,
              height: 260,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(18, 14, 18, 14),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Delivery Address',
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.grey.shade500,
                      ),
                      textAlign: TextAlign.start,
                    ),
                    SizedBox(height: 15),
                    Inputfield(
                      cont: searchcontroller,
                      type: TextInputType.emailAddress,
                      hint: '2118 ThrownBridge . Cir .Cirasuse',
                      option: false,
                    ),
                    SizedBox(height: 30),
                    Row(
                      children: [
                        Text(
                          'Price',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(width: 8),
                        // Text(
                        //   '\$23',
                        //   style: TextStyle(
                        //     color: Colors.grey.shade500,
                        //     fontWeight: FontWeight.bold,
                        //     fontSize: 20,
                        //   ),
                        // ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Button(
                      color: Colorutil.color,
                      text: 'PLACE ORDER',
                      action: () {
                        Get.to(() => Payment());
                      },
                      height: 50,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
