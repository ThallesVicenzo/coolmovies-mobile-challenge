import 'package:app_design/widgets/image/network_image_widget.dart';
import 'package:app_design/widgets/text/cool_movies_text.dart';
import 'package:coolmovies/core/extensions/date_format_extensions.dart';
import 'package:flutter/material.dart';

import '../../domain/entity/movie_details.dart';

class MovieInfo extends StatelessWidget {
  const MovieInfo({
    super.key,
    required this.entity,
  });

  final MovieDetailsEntity entity;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: NetworkImageWidget(
            url: entity.imgUrl,
            fit: BoxFit.fitHeight,
            size: const Size(150, 300),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8),
          child: Column(
            children: [
              SizedBox(
                width: 200,
                child: CoolMoviesText(
                  text: entity.title,
                  fontWeight: FontWeight.bold,
                  size: 16,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: SizedBox(
                  width: 200,
                  child: CoolMoviesText(
                    text: 'Release Date : ${entity.releaseDate.formattedDate}',
                    fontWeight: FontWeight.w700,
                    size: 12,
                  ),
                ),
              ),
              SizedBox(
                width: 200,
                child: CoolMoviesText(
                  text: entity.directorName,
                  fontWeight: FontWeight.bold,
                  size: 16,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
