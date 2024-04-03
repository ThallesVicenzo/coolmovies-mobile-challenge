import 'package:app_design/widgets/colors/colors_palette.dart';
import 'package:app_design/widgets/text/cool_movies_text.dart';
import 'package:flutter/material.dart';

import '../../domain/entity/movie_details.dart';

class OtherReviewsPreview extends StatelessWidget {
  const OtherReviewsPreview({
    super.key,
    required this.entity,
    this.confirmDismiss,
    required this.id,
  });

  final MovieDetailsEntity entity;
  final Future<bool?> Function(DismissDirection)? confirmDismiss;
  final String id;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      itemCount: entity.movieReviewsByMovieId.length < 3 ? 2 : 3,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.only(bottom: 16, left: 8),
        child: Dismissible(
          key: UniqueKey(),
          direction: DismissDirection.endToStart,
          confirmDismiss: confirmDismiss,
          background: Container(
            decoration: const BoxDecoration(
              color: ColorsPalette.saffron,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(4),
              ),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(
                  Icons.delete_outline,
                  color: ColorsPalette.marfim,
                ),
                SizedBox(width: 16),
              ],
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CoolMoviesText(
                    text: entity.movieReviewsByMovieId[index].title,
                    size: 20,
                    fontWeight: FontWeight.w500,
                  ),
                  CoolMoviesText(
                    text:
                        '${entity.movieReviewsByMovieId[index].rating.toString()}/5',
                    size: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ],
              ),
              CoolMoviesText(
                text: entity.movieReviewsByMovieId[index].user.name,
                size: 20,
                fontWeight: FontWeight.w500,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
