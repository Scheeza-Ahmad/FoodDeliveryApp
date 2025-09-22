import 'package:food/models/base_product.dart';
import 'package:food/utils/asset_util.dart';

class SandwichStopPopularModel extends BaseProduct {
  @override
  final String image;
  @override
  final String name;
  @override
  final double price;
  SandwichStopPopularModel({
    required this.image,
    required this.name,
    required this.price,
  });
  static List<SandwichStopPopularModel> popular = [
    SandwichStopPopularModel(
      image: AssetUtil.eggsandwich,
      name: 'Egg Sandwich',
      price: 250,
    ),
    SandwichStopPopularModel(
      image: AssetUtil.cheesesandwich,
      name: 'Cheese Sandwich',
      price: 300,
    ),
    SandwichStopPopularModel(
      image: AssetUtil.chickensandwich,
      name: 'Chicken Sandwich',
      price: 290,
    ),
    SandwichStopPopularModel(
      image: AssetUtil.mixedsandwich,
      name: 'Mixed Sandwich',
      price: 300,
    ),
    SandwichStopPopularModel(
      image: AssetUtil.specialsandwich,
      name: 'Special Sandwich',
      price: 360,
    ),
  ];
}
