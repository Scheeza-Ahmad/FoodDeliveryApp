import 'package:flutter/material.dart';
import 'package:food/controller/cart_controller.dart';
import 'package:food/controller/resturant_menu_controller.dart';
import 'package:food/models/continental_bites_popular_model.dart';
import 'package:food/screens/cart_screen.dart';
import 'package:food/utils/asset_util.dart';
import 'package:food/utils/color_util.dart';
import 'package:food/utils/string_util.dart';
import 'package:food/widgets/icon_btn.dart';
import 'package:get/get.dart';

class ContinentalBitesResturant extends StatelessWidget {
  const ContinentalBitesResturant({super.key});

  @override
  Widget build(BuildContext context) {
    final CartController cartController = Get.find();
    final ResturantMenuController menuController = Get.put(
      ResturantMenuController(ContinentalBitesPopularModel.popular),
      tag: "continental_bites",
    );
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Iconbtn(
                        color: Colors.grey.shade700,
                        action: () {
                          Get.back();
                        },
                        icon: Icons.arrow_back,
                      ),
                      Iconbtn(
                        color: Colors.grey.shade700,
                        action: () {
                          Get.to(() => Cartscreen());
                        },
                        icon: Icons.trolley,
                      ),
                    ],
                  ),
                  const SizedBox(height: 14),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      AssetUtil.continental,
                      height: 200,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Continental Bites Resturant',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: Stringutil.headingsize,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.star, color: Colorutil.color),
                      Icon(Icons.star, color: Colorutil.color),
                      Icon(Icons.star, color: Colorutil.color),
                      Icon(Icons.star, color: Colorutil.color),
                      Icon(Icons.star_border, color: Colorutil.color),
                      const SizedBox(width: 6),
                      Text(
                        '4.0',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: Stringutil.content,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 6),
                      const Text(
                        '(Rating 100+)',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            Expanded(
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(158, 235, 229, 229),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextField(
                        onChanged: (value) {
                          menuController.updateSearch(value);
                        },
                        decoration: InputDecoration(
                          hintText: "Search anything from menu",
                          prefixIcon: Icon(Icons.search),

                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),

                      Row(
                        children: [
                          const Icon(
                            Icons.local_fire_department_sharp,
                            color: Color.fromARGB(255, 184, 16, 4),
                          ),
                          const SizedBox(width: 7),
                          const Text(
                            'Popular',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ],
                      ),
                      const Text(
                        'Most Ordered right now',
                        style: TextStyle(
                          color: Color.fromARGB(255, 77, 76, 76),
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 12),

                      SizedBox(
                        height: 230,
                        child: Obx(
                          () => ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: menuController.filteredItems.length,
                            itemBuilder: (context, index) {
                              var item = menuController.filteredItems[index];
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
                                            Get.snackbar(
                                              "Added to Cart",
                                              "${item.name} added successfully",
                                              snackPosition: SnackPosition.TOP,
                                              backgroundColor: Colors.green
                                                  .withOpacity(0.7),
                                              colorText: Colors.white,
                                            );
                                          },
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.green,
                                            foregroundColor: Colors.white,
                                            padding: const EdgeInsets.symmetric(
                                              vertical: 6,
                                            ),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                          ),
                                          child: const Text(
                                            'Add to Cart',
                                            style: TextStyle(
                                              fontSize: 12,
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
                      ),
                      const SizedBox(height: 12),

                      Row(
                        children: [
                          Icon(
                            Icons.restaurant_menu_sharp,
                            color: Colorutil.color,
                          ),
                          const SizedBox(width: 7),
                          const Text(
                            'Menu',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),

                      Obx(
                        () => ListView.separated(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: menuController.filteredItems.length,
                          itemBuilder: (context, index) {
                            var item = menuController.filteredItems[index];
                            return ListTile(
                              leading: ClipRRect(
                                borderRadius: BorderRadius.circular(14),
                                child: CircleAvatar(
                                  backgroundImage: AssetImage(item.image),
                                ),
                              ),
                              title: Text(
                                item.name,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              subtitle: Text(
                                item.price.toString(),
                                style: const TextStyle(
                                  color: Color.fromARGB(255, 63, 62, 62),
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              trailing: Iconbtn(
                                color: Colorutil.color,
                                action: () {
                                  cartController.addToCart(item);
                                  Get.snackbar(
                                    "Added to Cart",
                                    "${item.name} added successfully",
                                    snackPosition: SnackPosition.TOP,
                                    backgroundColor: Colors.green.withOpacity(
                                      0.7,
                                    ),
                                    colorText: Colors.white,
                                  );
                                },
                                icon: Icons.add,
                              ),
                            );
                          },
                          separatorBuilder: (context, index) => Divider(
                            color: Colors.grey[400],
                            thickness: 1,
                            height: 1,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
