import 'package:flutter/material.dart';
import 'package:food/models/payment_card.dart';

class Paymentoption extends StatelessWidget {
  final PaymentCard pay;
  const Paymentoption({super.key, required this.pay});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Get.to('');
        print('Food Card is clicked');
      },
      child: Card(
        elevation: 4,
        margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Container(
          width: 180,
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  pay.image,
                  height: 120,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 15),

              Text(
                pay.item,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
