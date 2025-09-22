import 'package:food/models/base_product.dart';
import 'package:food/utils/asset_util.dart';

class PancakePopularModel extends BaseProduct {
  @override
  final String image;
  @override
  final String name;
  @override
  final double price;
  PancakePopularModel({
    required this.image,
    required this.name,
    required this.price,
  });
  static List<PancakePopularModel> popular = [
    PancakePopularModel(
      image: AssetUtil.cappuccino,
      name: 'Capuccino',
      price: 280,
    ),
    PancakePopularModel(image: AssetUtil.latte, name: 'Latte', price: 450),
    PancakePopularModel(
      image: AssetUtil.bluepancake,
      name: 'Pancake',
      price: 550,
    ),
    PancakePopularModel(image: AssetUtil.waffles, name: 'Waffles', price: 380),
    PancakePopularModel(image: AssetUtil.tea, name: 'Tea', price: 150),
  ];
}
