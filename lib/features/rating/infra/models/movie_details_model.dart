import 'package:coolmovies/core/domain/entities/user_entity.dart';
import 'package:coolmovies/core/map_extensions.dart';
import 'package:coolmovies/features/rating/domain/entity/movie_details.dart';
import 'package:coolmovies/features/rating/domain/entity/movie_reviews.dart';

class MovieDetailsModel extends MovieDetailsEntity {
  MovieDetailsModel({
    required super.imgUrl,
    required super.title,
    required super.releaseDate,
    required super.directorName,
    required super.movieReviewsByMovieId,
  });

  factory MovieDetailsModel.fromJson(Map<String, dynamic> json) {
    List<MovieReviewsEntity> reviews = [];

    for (var review in json.getValue('movieReviewsByMovieId')['nodes']) {
      reviews.add(MovieReviewsModel.fromJson(review));
    }

    return MovieDetailsModel(
      imgUrl: json.getValue('imgUrl'),
      title: json.getValue('title'),
      releaseDate: DateTime.parse(json.getValue('releaseDate')),
      directorName: json.getValue('movieDirectorByMovieDirectorId')['name'],
      movieReviewsByMovieId: reviews,
    );
  }
}

class MovieReviewsModel extends MovieReviewsEntity {
  MovieReviewsModel({
    required super.title,
    required super.rating,
    required super.userReviewerId,
    required super.body,
    required super.user,
  });

  factory MovieReviewsModel.fromJson(Map<String, dynamic> json) =>
      MovieReviewsModel(
        title: json.getValue('title'),
        rating: json.getValue('rating'),
        userReviewerId: json.getValue('id'),
        body: json.getValue('body'),
        user: UserModel.fromJson(
          json.getValue('userByUserReviewerId'),
        ),
      );
}

class UserModel extends UserEntity {
  UserModel({required super.name, required super.id});

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        name: json.getValue('name'),
        id: json.getValue('id'),
      );
}
