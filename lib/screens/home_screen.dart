import 'package:flutter/material.dart';
import 'package:food/controller/cart_controller.dart';
import 'package:food/controller/resturant_controller.dart';
import 'package:food/models/homepage_card.dart';
import 'package:food/screens/cart_screen.dart';
import 'package:food/screens/login_screen.dart';
import 'package:food/screens/profile_screen.dart';
import 'package:food/utils/color_util.dart';
import 'package:food/utils/string_util.dart';
import 'package:food/widgets/icon_btn.dart';
import 'package:food/widgets/resturant.dart';
import 'package:get/get.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Homescreen extends StatelessWidget {
  Homescreen({super.key});

  final TextEditingController searchController = TextEditingController();
  final CartController cartController = Get.find();
  final RestaurantController restaurantController = Get.find();

  Future<void> logoutUser() async {
    final pref = await SharedPreferences.getInstance();

    // session clear karna
    await pref.setBool("isLoggedIn", false);

    Fluttertoast.showToast(
      msg: 'You have been logged out!',
      gravity: ToastGravity.CENTER,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0,
    );

    // Login screen par bhejna
    Get.offAll(() => Loginscreen());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // 🔹 Top Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Left side (Deliver To)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Welcome to Foodies Hub 🍴',
                            style: TextStyle(
                              color: Colorutil.color,
                              fontSize: Stringutil.mainsize,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Discover delicious meals near you 😋',
                            style: TextStyle(
                              color: Colors.grey[700],
                              fontSize: Stringutil.content,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),

                      Column(
                        children: [
                          PopupMenuButton<int>(
                            icon: const Icon(Icons.person, size: 32),
                            onSelected: (value) {
                              if (value == 1) {
                                Get.to(() => ProfileScreen());
                              } else if (value == 2) {
                                logoutUser();
                              }
                            },
                            itemBuilder: (context) => [
                              const PopupMenuItem(
                                value: 1,
                                child: Row(
                                  children: [
                                    Icon(Icons.person, color: Colors.black),
                                    SizedBox(width: 8),
                                    Text(
                                      "Profile",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const PopupMenuItem(
                                value: 2,
                                child: Row(
                                  children: [
                                    Icon(Icons.logout, color: Colors.red),
                                    SizedBox(width: 8),
                                    Text(
                                      "Logout",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.red,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                            offset: const Offset(-48, 12), // left dropdown
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          const SizedBox(height: 10),

                          // Cart button
                          Iconbtn(
                            color: const Color(0xff181C2E),
                            action: () {
                              Get.to(() => Cartscreen());
                            },
                            icon: Icons.trolley,
                          ),
                        ],
                      ),
                    ],
                  ),

                  Row(
                    children: [
                      Text(
                        'Pick Your Craving 🍴',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: Stringutil.mainsize,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  // 🔹 Search Bar
                  TextField(
                    controller: searchController,
                    onChanged: (value) {
                      restaurantController.searchQuery.value = value;
                    },
                    decoration: InputDecoration(
                      hintText: "Search your favourite restaurant",
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  // 🔹 Main Content / Search Results
                  Obx(() {
                    // agar search box empty hai
                    if (restaurantController.searchQuery.value.isEmpty) {
                      return Column(
                        children: [
                          // Categories Section
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

                          // 🔹 Horizontal Product List
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(12),
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
                                                msg:
                                                    '${item.name} added successfully',
                                                gravity: ToastGravity.CENTER,
                                                timeInSecForIosWeb: 1,
                                                backgroundColor:
                                                    Colorutil.color,
                                                textColor: Colors.white,
                                                fontSize: 16.0,
                                              );
                                            },
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: Colors.green,
                                              foregroundColor: Colors.white,
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                vertical: 8,
                                              ),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8),
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

                          // 🔹 Open Restaurants
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

                          // 🔹 Restaurant List
                          ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: restaurantController
                                .filteredRestaurants.length,
                            itemBuilder: (context, index) {
                              return Resturant(
                                restu: restaurantController
                                    .filteredRestaurants[index],
                              );
                            },
                          ),
                        ],
                      );
                    } else {
                      // agar search kiya gaya hai to sirf filtered restaurants dikhayen
                      if (restaurantController.filteredRestaurants.isEmpty) {
                        return const Center(
                          child: Text(
                            "No restaurant found",
                            style:
                                TextStyle(color: Colors.grey, fontSize: 16),
                          ),
                        );
                      }
                      return ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount:
                            restaurantController.filteredRestaurants.length,
                        itemBuilder: (context, index) {
                          return Resturant(
                            restu: restaurantController
                                .filteredRestaurants[index],
                          );
                        },
                      );
                    }
                  }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
