import 'package:flutter/material.dart';
import 'package:food/utils/Colorutil.dart';
import 'package:food/utils/Stringutil.dart';
import 'package:food/widgets/iconbtn.dart';
import 'package:food/widgets/iconbutton.dart';
import 'package:food/widgets/searchbar.dart';
import 'package:get/get.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    final SearchController = TextEditingController();
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Iconbtn(
                    color: Colors.grey.shade700,
                    action: () {
                      Get.to('');
                    },
                    icon: Icons.menu,
                  ),
                  SizedBox(width: 18),
                  Column(
                    children: [
                      Text(
                        'DELIVER TO',
                        style: TextStyle(
                          color: Colorutil.color,
                          fontSize: Stringutil.content,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Halal Lab office',
                        style: TextStyle(
                          color: Colors.grey[700],
                          fontSize: Stringutil.content,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Iconbtn(
                color: Color(0xff181C2E),
                action: () {
                  Get.to('');
                },
                icon: Icons.trolley,
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            children: [
              Text(
                'Hey Halal,',
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: Stringutil.mainsize,
                ),
              ),
              Text(
                'Good Afternoon!',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: Stringutil.mainsize,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Searchbar(
            cont: SearchController,
            type: TextInputType.name,
            hint: 'Search dishes,resturant',
          ),
        ],
      ),
    );
  }
}
