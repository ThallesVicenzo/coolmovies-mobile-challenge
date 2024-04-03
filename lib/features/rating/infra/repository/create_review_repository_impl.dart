import 'package:coolmovies/core/exception/default_error.dart';
import 'package:coolmovies/core/response.dart';
import 'package:coolmovies/features/rating/domain/repository/create_review_repository.dart';
import 'package:coolmovies/features/rating/infra/data_source/create_review_data_source.dart';
import 'package:graphql_flutter/graphql_flutter.dart' hide Response;

class CreateReviewRepositoryImpl implements CreateReviewRepository {
  final CreateReviewDataSource dataSource;

  CreateReviewRepositoryImpl({required this.dataSource});

  @override
  Future<Response<DefaultError, bool>> call(
    String title,
    String body,
    String movieId,
    int rating,
  ) async {
    try {
      final data = await dataSource.call(title, body, movieId, rating);
      return Success(data);
    } on GraphQLError catch (e) {
      return Response.fail(
        DefaultError(e.message),
      );
    } catch (e) {
      return Response.fail(
        DefaultError(e.toString()),
      );
    }
  }
}
