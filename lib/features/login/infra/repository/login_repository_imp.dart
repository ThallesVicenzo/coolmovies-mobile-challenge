import 'package:coolmovies/core/exception/default_error.dart';
import 'package:coolmovies/core/response.dart';
import 'package:coolmovies/features/login/domain/entities/login_entity.dart';
import 'package:coolmovies/features/login/domain/repository/login_repository.dart';
import 'package:coolmovies/features/login/infra/data_source/login_data_source.dart';
import 'package:graphql_flutter/graphql_flutter.dart' hide Response;

class LoginRepositoryImp implements LoginRepository {
  final LoginDataSource dataSource;

  LoginRepositoryImp({
    required this.dataSource,
  });

  @override
  Future<Response<DefaultError, LoginEntity>> call(String name) async {
    try {
      final data = await dataSource.call(name);
      return Success(data);
    } on GraphQLError catch (e) {
      return Response.fail(
        DefaultError(e.message),
      );
    } catch (e) {
      return Response.fail(
        const DefaultError(),
      );
    }
  }
}
