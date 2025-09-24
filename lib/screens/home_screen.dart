import 'package:flutter/material.dart';
import 'package:food/controller/cart_controller.dart';
import 'package:food/controller/resturant_controller.dart';
import 'package:food/models/homepage_card.dart';
import 'package:food/screens/cart_screen.dart';
import 'package:food/utils/color_util.dart';
import 'package:food/utils/string_util.dart';
import 'package:food/widgets/icon_btn.dart';
import 'package:food/widgets/resturant.dart';
import 'package:get/get.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Homescreen extends StatelessWidget {
  Homescreen({super.key});

  final TextEditingController searchController = TextEditingController();
  final CartController cartController = Get.find();
  final RestaurantController restaurantController = Get.find();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
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
                    Iconbtn(
                      color: const Color(0xff181C2E),
                      action: () {
                        Get.to(() => const Cartscreen());
                      },
                      icon: Icons.trolley,
                    ),
                  ],
                ),

                const SizedBox(height: 20),
                Row(
                  children: [
                    Text(
                      'Hey Halal, ',
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

                const SizedBox(height: 20),
                TextField(
                  onChanged: (value) {
                    restaurantController.searchQuery.value = value;
                  },
                  decoration: InputDecoration(
                    hintText: "Search your favourite resturant",
                    prefixIcon: Icon(Icons.search),

                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'All Categories',
                      style: TextStyle(
                        fontSize: Stringutil.mainsize,
                        color: Colors.grey[700],
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 15),
                SizedBox(
                  height: 230,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: HomepageCard.product.length,
                    itemBuilder: (context, index) {
                      HomepageCard item = HomepageCard.product[index];
                      return Card(
                        elevation: 4,
                        margin: const EdgeInsets.symmetric(
                          horizontal: 5,
                          vertical: 8,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Container(
                          width: 160,
                          padding: const EdgeInsets.all(12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.asset(
                                  item.image,
                                  height: 90,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                item.name,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Starting',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey[700],
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    item.price.toString(),
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey[700],
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),
                              SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                  onPressed: () {
                                    cartController.addToCart(item);
                                    Fluttertoast.showToast(
                                      msg: '${item.name} added successfully',
                                      gravity: ToastGravity.CENTER,
                                      timeInSecForIosWeb: 1,
                                      backgroundColor: Colorutil.color,

                                      textColor: Colors.white,
                                      fontSize: 16.0,
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.green,
                                    foregroundColor: Colors.white,
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 8,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  child: const Text(
                                    'Add to Cart',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Open Restaurants',
                      style: TextStyle(
                        fontSize: Stringutil.mainsize,
                        color: Colors.grey[700],
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),

                Obx(() {
                  if (restaurantController.filteredRestaurants.isEmpty) {
                    return const Center(
                      child: Text(
                        "No restaurant found",
                        style: TextStyle(color: Colors.grey, fontSize: 16),
                      ),
                    );
                  }
                  return ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: restaurantController.filteredRestaurants.length,
                    itemBuilder: (context, index) {
                      return Resturant(
                        restu: restaurantController.filteredRestaurants[index],
                      );
                    },
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
