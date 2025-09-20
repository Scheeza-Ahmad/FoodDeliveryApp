import 'package:food/models/base_product.dart';
import 'package:food/utils/asset_util.dart';

class DesiDelightModel extends BaseProduct{
  final String image;
  final String name;
  final double price;
  DesiDelightModel({
    required this.image,
    required this.name,
    required this.price,
  });
  static List<DesiDelightModel> popular = [
    DesiDelightModel(
      image: AssetUtil.seekhkabab,
      name: 'Seekh Kabab',
      price: 1800,
    ),
    DesiDelightModel(
      image: AssetUtil.roast,
      name: 'Chicken Roast',
      price: 1200,
    ),
    DesiDelightModel(
      image: AssetUtil.heleem,
      name: 'Chicken Haleem',
      price: 300,
    ),
    DesiDelightModel(
      image: AssetUtil.afghani,
      name: 'Afghani Karahi',
      price: 900,
    ),
    DesiDelightModel(
      image: AssetUtil.butterchicken,
      name: 'Butter Chicken',
      price: 1100,
    ),
  ];
}
