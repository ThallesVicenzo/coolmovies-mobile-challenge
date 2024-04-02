import 'package:coolmovies/features/rating/domain/entity/movie_reviews.dart';

class MovieDetailsEntity {
  final String imgUrl;
  final String title;
  final DateTime releaseDate;
  final String directorName;
  final List<MovieReviewsEntity> movieReviewsByMovieId;

  MovieDetailsEntity({
    required this.imgUrl,
    required this.title,
    required this.releaseDate,
    required this.directorName,
    required this.movieReviewsByMovieId,
  });
}
