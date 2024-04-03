import 'package:app_design/widgets/buttons/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../domain/entity/movie_details.dart';
import '../../rating_routes.dart';
import '../controllers/movie_details_controller.dart';

class ButtonsMenu extends StatelessWidget {
  const ButtonsMenu({
    super.key,
    required this.entity,
    required this.controller,
  });

  final MovieDetailsEntity entity;
  final MovieDetailsController controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        PrimaryButton(
          title: 'Write a Review',
          size: const Size(170, 36),
          icon: Icons.edit,
          onTap: () {
            controller.updateVisibility();
          },
        ),
        PrimaryButton(
          title: 'See All Reviews',
          size: const Size(170, 36),
          onTap: () {
            Modular.to.pushNamed(
              RatingRoutes.allReviews.path,
              arguments: {'reviews': entity.movieReviewsByMovieId},
            );
          },
        ),
      ],
    );
  }
}
