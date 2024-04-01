import 'package:coolmovies/core/exception/default_error.dart';
import 'package:coolmovies/core/response.dart';
import 'package:coolmovies/features/home/domain/entities/home_entity.dart';
import 'package:coolmovies/features/home/domain/repository/home_repository.dart';
import 'package:coolmovies/features/home/infra/data_source/home_data_source.dart';
import 'package:graphql_flutter/graphql_flutter.dart' hide Response;

class HomeRepositoryImp implements HomeRepository {
  final HomeDataSource dataSource;

  HomeRepositoryImp({
    required this.dataSource,
  });

  @override
  Future<Response<DefaultError, List<HomeEntity>>> fetchData() async {
    try {
      final data = await dataSource.fetchData();
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
