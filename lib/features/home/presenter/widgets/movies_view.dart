import 'package:app_design/widgets/image/network_image_widget.dart';
import 'package:app_design/widgets/text/cool_movies_text.dart';
import 'package:coolmovies/core/main_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../domain/entities/home_entity.dart';

class MoviesView extends StatelessWidget {
  const MoviesView({
    super.key,
    required this.movie,
  });

  final HomeEntity movie;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Modular.to.pushNamed(MainRoutes.rating.route);
      },
      child: Column(
        children: [
          NetworkImageWidget(
            url: movie.imgUrl,
            size: const Size(150, 150),
          ),
          const SizedBox(
            height: 4,
          ),
          CoolMoviesText(
            text: movie.name,
            fontWeight: FontWeight.w500,
            size: 12,
          ),
        ],
      ),
    );
  }
}
