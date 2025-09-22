import 'package:food/models/base_product.dart';
import 'package:food/utils/asset_util.dart';

class ContinentalBitesPopularModel extends BaseProduct{
  @override
  final String image;
  @override
  final String name;
  @override
  final double price;
  ContinentalBitesPopularModel({
    required this.image,
    required this.name,
    required this.price,
  });
  static List<ContinentalBitesPopularModel> popular = [
    ContinentalBitesPopularModel(
      image: AssetUtil.spaghettis,
      name: 'Spaghettis',
      price: 800,
    ),
    ContinentalBitesPopularModel(
      image: AssetUtil.redsaucepasta,
      name: 'Red Sauce Pasta',
      price: 750,
    ),
    ContinentalBitesPopularModel(
      image: AssetUtil.whitesaucepasta,
      name: 'Alferado Pasta',
      price: 750,
    ),
    ContinentalBitesPopularModel(
      image: AssetUtil.steak,
      name: 'Steak',
      price: 2000,
    ),
    ContinentalBitesPopularModel(
      image: AssetUtil.cheesepasta,
      name: 'Cheese Pasta',
      price: 800,
    ),
  ];
}
