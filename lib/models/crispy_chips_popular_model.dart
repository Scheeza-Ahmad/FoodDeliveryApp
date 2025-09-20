import 'package:food/models/base_product.dart';
import 'package:food/utils/asset_util.dart';

class CrispyChipsPopularModel extends BaseProduct{
  final String image;
  final String name;
  final double price;
  CrispyChipsPopularModel({
    required this.image,
    required this.name,
    required this.price,
  });
  static List<CrispyChipsPopularModel> popular = [
    CrispyChipsPopularModel(
      image: AssetUtil.simple,
      name: 'Simple Fries',
      price: 100,
    ),
    CrispyChipsPopularModel(
      image: AssetUtil.masala,
      name: 'Masala Fries',
      price: 130,
    ),
    CrispyChipsPopularModel(
      image: AssetUtil.special,
      name: 'Special Fries',
      price: 140,
    ),
    CrispyChipsPopularModel(
      image: AssetUtil.loaded,
      name: 'Loaded Fries',
      price: 350,
    ),
    CrispyChipsPopularModel(
      image: AssetUtil.chicken,
      name: 'Chicken Fries',
      price: 450,
    ),
  ];
}
