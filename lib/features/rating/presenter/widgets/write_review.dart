import 'package:app_design/widgets/colors/colors_palette.dart';
import 'package:app_design/widgets/text/cool_movies_text.dart';
import 'package:flutter/material.dart';

import '../controllers/movie_details_controller.dart';

class WriteReview extends StatelessWidget {
  const WriteReview({
    super.key,
    required this.controller,
  });

  final MovieDetailsController controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CoolMoviesText(
          text: 'Write A Review ',
          fontWeight: FontWeight.bold,
          size: 20,
        ),
        const Icon(
          Icons.edit,
          color: ColorsPalette.marfim,
        ),
        const Spacer(),
        TextButton(
          onPressed: () {
            controller.updateVisibility();
          },
          child: const CoolMoviesText(
            text: 'Back',
            size: 14,
          ),
        ),
      ],
    );
  }
}
