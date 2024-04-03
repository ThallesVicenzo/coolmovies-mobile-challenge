import 'package:coolmovies/core/exception/default_error.dart';
import 'package:coolmovies/core/response.dart';
import 'package:coolmovies/features/rating/domain/repository/create_review_repository.dart';

abstract class CreateReviewUseCase {
  Future<Response<DefaultError, bool>> call(
    String title,
    String body,
    String movieId,
    int rating,
  );
}

class CreateReviewUseCaseImpl implements CreateReviewUseCase {
  final CreateReviewRepository repository;

  CreateReviewUseCaseImpl({required this.repository});

  @override
  Future<Response<DefaultError, bool>> call(
    String title,
    String body,
    String movieId,
    int rating,
  ) async {
    return await repository.call(title, body, movieId, rating);
  }
}
