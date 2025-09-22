import 'package:food/models/base_product.dart';
import 'package:food/utils/asset_util.dart';

class LayersPopularModel extends BaseProduct{
  @override
  final String image;
  @override
  final String name;
  @override
  final double price;
  LayersPopularModel({
    required this.image,
    required this.name,
    required this.price,
  });
  static List<LayersPopularModel> popular = [
    LayersPopularModel(
      image: AssetUtil.rasberry,
      name: 'Rasberry Cake',
      price: 1600,
    ),
    LayersPopularModel(
      image: AssetUtil.cupcake,
      name: 'CupCake',
      price: 300,
    ),
    LayersPopularModel(
      image: AssetUtil.chocolate,
      name: 'Chocolate Cake',
      price: 1800,
    ),
    LayersPopularModel(
      image: AssetUtil.cherry,
      name: 'Cherry Cake',
      price: 1600,
    ),
    LayersPopularModel(
      image: AssetUtil.blackberry,
      name: 'BlackBerry Cake',
      price: 2100,
    ),
  ];
}
