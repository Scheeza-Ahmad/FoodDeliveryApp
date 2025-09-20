import 'package:food/models/base_product.dart';
import 'package:food/utils/asset_util.dart';

class ChinaTownPopularModel extends BaseProduct {
  final String image;
  final String name;
  final double price;
  ChinaTownPopularModel({
    required this.image,
    required this.name,
    required this.price,
  });
  static List<ChinaTownPopularModel> popular = [
    ChinaTownPopularModel(
      image: AssetUtil.vegnoodles,
      name: 'Veg Noddles',
      price: 650,
    ),
    ChinaTownPopularModel(image: AssetUtil.soup, name: 'Soup', price: 870),
    ChinaTownPopularModel(image: AssetUtil.ramen, name: 'Ramen', price: 850),
    ChinaTownPopularModel(
      image: AssetUtil.noodlessoup,
      name: 'Noodles Soup',
      price: 900,
    ),
    ChinaTownPopularModel(
      image: AssetUtil.greensoup,
      name: 'Green Soup',
      price: 650,
    ),
  ];
}
