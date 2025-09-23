import 'package:flutter/material.dart';
import 'package:food/utils/asset_util.dart';
import 'package:food/widgets/button.dart';
import 'package:lottie/lottie.dart';

class LastScreen extends StatelessWidget {
  final String image;
  final String heading;
  final String text;
  final String lasttext;
  final String btntext;
  final String sbtntext;
  final Color color;
  final VoidCallback action;
  final VoidCallback secondaction;

  const LastScreen({
    super.key,
    required this.image,
    required this.heading,
    required this.text,
    required this.btntext,
    required this.action,
    required this.color,
    required this.lasttext,
    this.sbtntext = 'Trace Order',
    required this.secondaction,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Lottie.asset(AssetUtil.success, width: 600),
        SizedBox(height: 20),
        Text(
          heading,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        SizedBox(height: 12),
        Text(text, style: TextStyle(color: Colors.grey[600], fontSize: 14)),
        SizedBox(height: 12),
        Text(lasttext, style: TextStyle(color: Colors.grey[600], fontSize: 14)),
        SizedBox(height: 18),

        Button(color: color, text: btntext, action: action, height: 60),
        SizedBox(height: 18),
        Button(color: color, text: sbtntext, action: secondaction, height: 60),
      ],
    );
  }
}
