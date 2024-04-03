import 'package:coolmovies/core/exception/default_error.dart';
import 'package:coolmovies/core/response.dart';

abstract class CreateReviewRepository {
  Future<Response<DefaultError, bool>> call(
    String title,
    String body,
    String movieId,
    int rating,
  );
}
