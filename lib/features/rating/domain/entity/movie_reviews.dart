import 'package:coolmovies/core/domain/entities/user_entity.dart';

class MovieReviewsEntity {
  final String title;
  final int rating;
  final String userReviewerId;
  final String body;
  final UserEntity user;

  MovieReviewsEntity({
    required this.title,
    required this.rating,
    required this.userReviewerId,
    required this.body,
    required this.user,
  });
}
