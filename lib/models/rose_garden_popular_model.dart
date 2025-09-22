import 'package:food/models/base_product.dart';
import 'package:food/utils/asset_util.dart';

class RoseGardenPopularModel extends BaseProduct {
  @override
  final String image;
  @override
  final String name;
  @override
  final double price;
  RoseGardenPopularModel({
    required this.image,
    required this.name,
    required this.price,
  });
  static List<RoseGardenPopularModel> popular = [
    RoseGardenPopularModel(
      image: AssetUtil.hamburger,
      name: 'Hamburger',
      price: 800,
    ),
    RoseGardenPopularModel(
      image: AssetUtil.combo,
      name: 'Combo for Two',
      price: 1400,
    ),
    RoseGardenPopularModel(
      image: AssetUtil.korean,
      name: 'Korean beat',
      price: 700,
    ),
    RoseGardenPopularModel(
      image: AssetUtil.white,
      name: 'Saucy Burger',
      price: 600,
    ),
    RoseGardenPopularModel(
      image: AssetUtil.doublepatty,
      name: 'Double Patty',
      price: 1200,
    ),
  ];
}
