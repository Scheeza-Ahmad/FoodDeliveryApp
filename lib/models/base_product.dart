abstract class BaseProduct {
  String get image;
  String get name;
  double get price;
  int quantity;
  BaseProduct({this.quantity = 1});
}
