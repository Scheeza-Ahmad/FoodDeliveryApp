import 'package:food/models/base_product.dart';
import 'package:food/utils/asset_util.dart';

class HomepageCard extends BaseProduct{
  @override
  final String image;
  @override
  final String name;
  @override
  final double price;
  HomepageCard({required this.image, required this.name, required this.price});
  static final List<HomepageCard> product = [
    HomepageCard(image: AssetUtil.pizza, name: 'Pizza', price: 2000),
    HomepageCard(image: AssetUtil.burger, name: 'Burger', price: 780),
    HomepageCard(
      image: AssetUtil.hotdog,
      name: 'Hot Dog',
      price: 480,
    ),
    HomepageCard(
      image: AssetUtil.pasta,
      name: 'Pasta',
      price: 1200,
    ),
    HomepageCard(
      image: AssetUtil.sandwich,
      name: 'Sandwich',
      price: 400,
    ),
    HomepageCard(image: AssetUtil.suchi, name: 'Suchi', price: 22),
    HomepageCard(
      image: AssetUtil.pancake,
      name: 'PanCake',
      price: 1000,
    ),
    HomepageCard(image: AssetUtil.cake, name: 'Cake', price: 2200),
  ];
}
