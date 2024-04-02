import 'package:coolmovies/features/rating/domain/entity/movie_details.dart';
import 'package:coolmovies/features/rating/infra/data_source/movie_details_data_source.dart';
import 'package:coolmovies/features/rating/infra/models/movie_details_model.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class MovieDetailsDataSourceImpl implements MovieDetailsDataSource {
  final GraphQLClient client;

  MovieDetailsDataSourceImpl({required this.client});

  @override
  Future<MovieDetailsEntity> call(String id) async {
    final QueryResult result = await client.query(
      QueryOptions(
        variables: {
          'id': id,
        },
        document: gql('''
          query getMovieById{
            movieById(id: \$id) {
              imgUrl
              title
              releaseDate
              movieDirectorByMovieDirectorId {
                name
              }
              movieReviewsByMovieId {
                nodes {
                  body
                  rating
                  title
                  userByUserReviewerId {
                    name
                    id
                  }
                  id
                }
              }
            }
          } 
        '''),
      ),
    );

    final data = result.data?['movieById'];

    return MovieDetailsModel.fromJson(data);
  }
}
