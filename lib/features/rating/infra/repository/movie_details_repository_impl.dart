import 'package:coolmovies/core/exception/default_error.dart';
import 'package:coolmovies/core/response.dart';
import 'package:coolmovies/features/rating/domain/entity/movie_details.dart';
import 'package:coolmovies/features/rating/domain/repository/movie_details_repository.dart';
import 'package:coolmovies/features/rating/infra/data_source/movie_details_data_source.dart';
import 'package:graphql_flutter/graphql_flutter.dart' hide Response;

class MovieDetailsRepositoryImp implements MovieDetailsRepository {
  final MovieDetailsDataSource dataSource;

  MovieDetailsRepositoryImp({
    required this.dataSource,
  });

  @override
  Future<Response<DefaultError, MovieDetailsEntity>> call(String id) async {
    try {
      final data = await dataSource.call(id);
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
