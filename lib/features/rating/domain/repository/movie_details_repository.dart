import 'package:coolmovies/core/exception/default_error.dart';
import 'package:coolmovies/core/response.dart';
import 'package:coolmovies/features/rating/domain/entity/movie_details.dart';

abstract class MovieDetailsRepository {
  Future<Response<DefaultError, MovieDetailsEntity>> call(String id);
}
