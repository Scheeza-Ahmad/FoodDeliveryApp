import 'package:flutter/material.dart';
import 'package:food/utils/color_util.dart';
import 'package:food/widgets/button.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:rating_dialog/rating_dialog.dart' as rating_dialog;

class RatingDialog extends StatelessWidget {
  const RatingDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Center(
      child: Button(
        color: Colorutil.color,
        text: 'Rate our App',
        action: () => showRatingDialog(context, theme),
        width: 220,
        height: 50,
      ),
    );
  }

  void showRatingDialog(BuildContext context, ThemeData theme) {
    final dialog = Center(
      child: rating_dialog.RatingDialog(
        initialRating: 1.0,
        starSize: 28,
        title: Text(
          'Rating Dialog',
          textAlign: TextAlign.center,
          style: theme.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        message: Text(
          'Tap a star to set your rating. Add more description here if you want.',
          textAlign: TextAlign.center,
          style: theme.textTheme.bodyMedium,
        ),

        submitButtonText: 'Submit',
        commentHint: 'Please provide your feedback',
        onCancelled: () => print('cancelled'),
        onSubmitted: (response) {
          Get.snackbar('Thanks', 'Your Feedback is submitted!!');
          print('rating: ${response.rating}, comment: ${response.comment}');
        },
      ),
    );

    showDialog(context: context, builder: (context) => dialog);
  }
}
