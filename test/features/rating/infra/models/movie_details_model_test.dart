import 'package:coolmovies/features/rating/infra/models/movie_details_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test(
    'movie details model ...',
    () async {
      final Map<String, dynamic> json = {
        "data": {
          "movieById": {
            "imgUrl":
                "https://upload.wikimedia.org/wikipedia/en/d/d4/Rogue_One%2C_A_Star_Wars_Story_poster.png",
            "title": "Rogue One: A Star Wars Story",
            "releaseDate": "2016-12-16",
            "movieDirectorByMovieDirectorId": {"name": "Gareth Edwards"},
            "movieReviewsByMovieId": {
              "nodes": [
                {
                  "body":
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                  "rating": 4,
                  "title": "Best Action Movie",
                  "userByUserReviewerId": {
                    "name": "Ayla",
                    "id": "65549e6a-2389-42c5-909a-4475fdbb3e69"
                  },
                  "id": "335f0ff2-7f96-413f-8d26-6224039356c4"
                },
                {
                  "body":
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                  "rating": 5,
                  "title": "One of the best",
                  "userByUserReviewerId": {
                    "name": "Chrono",
                    "id": "5f1e6707-7c3a-4acd-b11f-fd96096abd5a"
                  },
                  "id": "5750da72-238b-44b3-9a92-02e3543861c4"
                }
              ]
            }
          }
        }
      };

      final data = json['data']!['movieById'];

      final model = MovieDetailsModel.fromJson(data);

      expect(model, isA<MovieDetailsModel>());
    },
  );
}
