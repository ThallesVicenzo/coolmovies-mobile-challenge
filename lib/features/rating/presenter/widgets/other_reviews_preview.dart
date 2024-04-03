import 'package:app_design/widgets/text/cool_movies_text.dart';
import 'package:flutter/material.dart';

import '../../domain/entity/movie_details.dart';

class OtherReviewsPreview extends StatelessWidget {
  const OtherReviewsPreview({
    super.key,
    required this.entity,
  });

  final MovieDetailsEntity entity;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      itemCount: entity.movieReviewsByMovieId.length < 3 ? 2 : 3,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.only(bottom: 16, left: 8),
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
    );
  }
}
