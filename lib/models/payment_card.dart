import 'package:food/utils/asset_util.dart';

class PaymentCard {
  final String image;
  final String item;
  PaymentCard({required this.image, required this.item});
  static final List<PaymentCard> option = [
    PaymentCard(image: AssetUtil.cash, item: 'Cash'),
    PaymentCard(image: AssetUtil.visa, item: 'VISA Card'),
    PaymentCard(image: AssetUtil.mastercard, item: 'MasterCard'),
    PaymentCard(image: AssetUtil.nayapay, item: 'NayaPay'),
    PaymentCard(image: AssetUtil.jazzcash, item: 'JazzCash'),
  ];
}
