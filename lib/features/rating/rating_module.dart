import 'package:coolmovies/features/rating/domain/entity/movie_reviews.dart';
import 'package:coolmovies/features/rating/domain/repository/create_review_repository.dart';
import 'package:coolmovies/features/rating/domain/repository/movie_details_repository.dart';
import 'package:coolmovies/features/rating/domain/usecases/create_review_usecase.dart';
import 'package:coolmovies/features/rating/domain/usecases/movie_details_usecase.dart';
import 'package:coolmovies/features/rating/external/movie_details_data_source_impl.dart';
import 'package:coolmovies/features/rating/infra/data_source/create_review_data_source.dart';
import 'package:coolmovies/features/rating/infra/data_source/movie_details_data_source.dart';
import 'package:coolmovies/features/rating/infra/repository/create_review_repository_impl.dart';
import 'package:coolmovies/features/rating/infra/repository/movie_details_repository_impl.dart';
import 'package:coolmovies/features/rating/presenter/pages/all_reviews_page.dart';
import 'package:coolmovies/features/rating/presenter/pages/movie_details_page.dart';
import 'package:coolmovies/features/rating/rating_routes.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'external/create_review_data_source_impl.dart';
import 'presenter/controllers/movie_details_controller.dart';

class RatingModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.factory<MovieDetailsDataSource>(
          (i) => MovieDetailsDataSourceImpl(
            client: i(),
          ),
        ),
        Bind.factory<MovieDetailsRepository>(
          (i) => MovieDetailsRepositoryImp(
            dataSource: i<MovieDetailsDataSource>(),
          ),
        ),
        Bind.factory<MovieDetailsUseCase>(
          (i) => MovieDetailsUseCaseImp(
            repository: i<MovieDetailsRepository>(),
          ),
        ),
        Bind.factory<CreateReviewDataSource>(
          (i) => CreateReviewDataSourceImpl(
            client: i(),
            secureStorage: i(),
          ),
        ),
        Bind.factory<CreateReviewRepository>(
          (i) => CreateReviewRepositoryImpl(
            dataSource: i<CreateReviewDataSource>(),
          ),
        ),
        Bind.factory<CreateReviewUseCase>(
          (i) => CreateReviewUseCaseImpl(
            repository: i<CreateReviewRepository>(),
          ),
        ),
        Bind.factory<MovieDetailsController>(
          (i) => MovieDetailsController(
            detailsUsecase: i<MovieDetailsUseCase>(),
            commentUseCase: i<CreateReviewUseCase>(),
          ),
        ),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          RatingRoutes.movieDetails.route,
          child: (context, args) => MovieDetailsPage(
            controller: context.read<MovieDetailsController>(),
            id: args.data['id'] as String,
          ),
        ),
        ChildRoute(
          RatingRoutes.allReviews.route,
          transition: TransitionType.rightToLeft,
          child: (context, args) => AllReviewsPage(
            entity: args.data['reviews'] as List<MovieReviewsEntity>,
          ),
        ),
      ];
}
