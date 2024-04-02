import 'package:coolmovies/features/rating/domain/entity/movie_details.dart';

abstract class MovieDetailsDataSource {
  Future<MovieDetailsEntity> call(String id);
}
