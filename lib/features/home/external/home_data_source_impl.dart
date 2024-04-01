import 'package:coolmovies/features/home/domain/entities/home_entity.dart';
import 'package:coolmovies/features/home/infra/data_source/home_data_source.dart';
import 'package:coolmovies/features/home/infra/model/home_model.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class HomeDataSourceImpl implements HomeDataSource {
  final GraphQLClient client;

  HomeDataSourceImpl({required this.client});

  @override
  Future<List<HomeEntity>> fetchData() async {
    final QueryResult result = await client.query(QueryOptions(
      document: gql(r"""
          query AllMovies {
            allMovies {
              nodes {
                id
                imgUrl
                title
              }
            }
          }
        """),
    ));
    final List nodes = result.data?['allMovies']['nodes'];

    return nodes.map((e) => HomeModel.fromJson(e)).toList();
  }
}
