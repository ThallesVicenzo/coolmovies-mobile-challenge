import 'package:coolmovies/core/domain/entities/user_entity.dart';
import 'package:coolmovies/core/page_state.dart';
import 'package:coolmovies/core/secure_storage/keys/secure_storage_keys.dart';
import 'package:coolmovies/core/secure_storage/secure_storage.dart';
import 'package:coolmovies/features/rating/domain/entity/movie_details.dart';
import 'package:coolmovies/features/rating/domain/usecases/create_review_usecase.dart';
import 'package:coolmovies/features/rating/domain/usecases/movie_details_usecase.dart';
import 'package:flutter/material.dart';

import '../../domain/entity/movie_reviews.dart';

class MovieDetailsController extends ChangeNotifier {
  final MovieDetailsUseCase detailsUsecase;
  final CreateReviewUseCase commentUseCase;
  final SecureStorage secureStorage;

  MovieDetailsController({
    required this.detailsUsecase,
    required this.commentUseCase,
    required this.secureStorage,
  });

  final movieDetailsState =
      ValueNotifier<PageState<MovieDetailsEntity>>(InitialState());

  final createCommentState = ValueNotifier<PageState<bool>>(InitialState());

  final visibility = ValueNotifier(true);

  int rating = 3;

  final TextEditingController title = TextEditingController();
  final TextEditingController body = TextEditingController();

  Future<String?> getId() async {
    final id = await secureStorage.read(key: SecureStorageKeys.id.key);
    return id;
  }

  void updateVisibility() {
    visibility.value = !visibility.value;
  }

  Future<void> createReview(
    String movieId,
    List<MovieReviewsEntity> listEntity,
  ) async {
    createCommentState.value = LoadingState();

    final result =
        await commentUseCase.call(title.text, body.text, movieId, rating);

    result.deal(
      onFail: (failure) =>
          createCommentState.value = ErrorState(error: failure),
      onSuccess: (success) async {
        final name = await secureStorage.read(key: SecureStorageKeys.name.key);
        final id = await getId();
        listEntity.add(
          MovieReviewsEntity(
            title: title.text,
            rating: rating,
            userReviewerId: id!,
            body: body.text,
            user: UserEntity(name: name!, id: id),
          ),
        );
        visibility.value = !visibility.value;
        createCommentState.value = SuccessState(data: success);
      },
    );
  }

  Future<void> searchMovieDetails(String id) async {
    movieDetailsState.value = LoadingState();

    final result = await detailsUsecase.call(id);

    result.deal(
      onFail: (failure) => movieDetailsState.value = ErrorState(error: failure),
      onSuccess: (success) =>
          movieDetailsState.value = SuccessState(data: success),
    );
  }
}
