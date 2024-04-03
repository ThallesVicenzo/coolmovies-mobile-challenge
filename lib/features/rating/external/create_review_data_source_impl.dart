import 'package:coolmovies/core/secure_storage/keys/secure_storage_keys.dart';
import 'package:coolmovies/core/secure_storage/secure_storage.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import '../infra/data_source/create_review_data_source.dart';

class CreateReviewDataSourceImpl implements CreateReviewDataSource {
  final GraphQLClient client;
  final SecureStorage secureStorage;

  CreateReviewDataSourceImpl(
      {required this.client, required this.secureStorage});

  @override
  Future<bool> call(
      String title, String body, String movieId, int rating) async {
    final id = await secureStorage.read(key: SecureStorageKeys.id.key);

    final QueryResult result = await client.mutate(
      MutationOptions(
        document: gql('''
          mutation {
            createMovieReview(input: {
              movieReview: {
                title: "$title",
                body: "$body",
                rating: $rating,
                userReviewerId: "$id",
                movieId: "$movieId"}}) 
              {
              movieReview {
                id
                title
                body
                rating
                movieByMovieId {
                  title
                }
                userByUserReviewerId {
                  name
                }
              }
            }
          }
        '''),
      ),
    );

    final data = result.data?['createMovieReview'];

    return data != null;
  }
}
