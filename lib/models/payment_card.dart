
class PaymentCard {
  final String image;
  final String item;
  PaymentCard({required this.image, required this.item});
  static final List<PaymentCard> option = [
    PaymentCard(image: 'assets/images/cash.png', item: 'Cash'),
    PaymentCard(image: 'assets/images/visa.png', item: 'VISA Card'),
    PaymentCard(image: 'assets/images/mastercard.png', item: 'MasterCard'),
    PaymentCard(image: 'assets/images/nayapay.png', item: 'nayaPay'),
    PaymentCard(image: 'assets/images/jazzcash.png', item: 'JazzCash'),
  ];
}
