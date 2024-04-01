import 'package:coolmovies/core/domain/entities/user_entity.dart';
import 'package:coolmovies/features/login/infra/models/login_model.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import '../infra/data_source/login_data_source.dart';

class LoginDataSourceImpl implements LoginDataSource {
  final GraphQLClient client;

  LoginDataSourceImpl({
    required this.client,
  });

  @override
  Future<UserEntity> call(String name) async {
    final QueryResult result = await client.mutate(
      MutationOptions(
        variables: {'name': name},
        document: gql('''
           mutation createUser(\$name: String!) {
              createUser(input: {user: {name: \$name}}) {
               user {
                  id
                  name
                }
              }
             }
        '''),
      ),
    );

    final user = result.data?['createUser']['user'];

    return LoginModel.fromJson(user);
  }
}
