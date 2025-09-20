import 'package:flutter/material.dart';
import 'package:food/controller/cart_controller.dart';
import 'package:food/models/homepage_card.dart';
import 'package:food/models/resturant_model.dart';
import 'package:food/screens/cart_screen.dart';
import 'package:food/screens/china_town_resturant_screen.dart';
import 'package:food/screens/continental_bites_resturant.dart';
import 'package:food/screens/crispy_chips_resturant_screen.dart';
import 'package:food/screens/desi_delight_resturant.dart';
import 'package:food/screens/layers_resturant_screen.dart';
import 'package:food/screens/pancake_house_screen.dart';
import 'package:food/screens/rose_garden_resturant_screen.dart';
import 'package:food/screens/sandwich_stop_screen.dart';
import 'package:food/utils/color_util.dart';
import 'package:food/utils/string_util.dart';
import 'package:food/widgets/icon_btn.dart';
import 'package:food/widgets/resturant.dart';
import 'package:food/widgets/search_bar.dart';
import 'package:get/get.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    final SearchController = TextEditingController();
    final CartController cartController = Get.find();

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 15),
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
                        Get.to(() => Cartscreen());
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
                SizedBox(height: 20),
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
                SizedBox(height: 15),
                SizedBox(
                  height: 200,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: HomepageCard.product.length,
                    itemBuilder: (context, index) {
                      HomepageCard item = HomepageCard.product[index];
                      return InkWell(
                        onTap: () {
                          cartController.addToCart(item);
                          Get.snackbar(
                            "Added to Cart",
                            "${item.name} added successfully",
                            snackPosition: SnackPosition.TOP,
                            backgroundColor: Colors.green.withOpacity(0.7),
                            colorText: Colors.white,
                          );
                        },

                        child: Card(
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
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Open Resturants',
                      style: TextStyle(
                        fontSize: Stringutil.mainsize,
                        color: Colors.grey[700],
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15),

                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: ResturantModel.resturant.length,
                  itemBuilder: (context, index) {
                    final restu = ResturantModel.resturant[index];

                    return InkWell(
                      onTap: () {
                        if (restu.name == "Rose Garden Restaurant") {
                          Get.to(() => const RoseGardenResturantScreen());
                        } else if (restu.name == "Crispy Chips Corner") {
                          Get.to(() => const CrispyChipsResturantScreen());
                        } else if (restu.name == "Desi Delight") {
                          Get.to(() => const DesiDelightResturant());
                        } else if (restu.name == "Continental Bites") {
                          Get.to(() => const ContinentalBitesResturant());
                        } else if (restu.name == "Layers Bakery") {
                          Get.to(() => const LayersResturantScreen());
                        } else if (restu.name == "China Town") {
                          Get.to(() => const ChinaTownResturantScreen());
                        } else if (restu.name == "Pancake House") {
                          Get.to(() => const PancakeHouseScreen());
                        } else if (restu.name == "Sandwich Stop") {
                          Get.to(() => const SandwichStopScreen());
                        }
                      },
                      child: Resturant(restu: restu),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
