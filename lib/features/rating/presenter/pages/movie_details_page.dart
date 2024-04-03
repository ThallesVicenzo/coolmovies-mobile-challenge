import 'package:app_design/app_bar/cool_movies_app_bar.dart';
import 'package:app_design/pages/default_erro_page.dart';
import 'package:app_design/widgets/buttons/primary_button.dart';
import 'package:app_design/widgets/loading/cool_movies_loading.dart';
import 'package:app_design/widgets/text/cool_movies_text.dart';
import 'package:app_design/widgets/textfield/cool_movies_text_field.dart';
import 'package:coolmovies/core/main_routes.dart';
import 'package:coolmovies/core/page_state.dart';
import 'package:coolmovies/features/rating/domain/entity/movie_details.dart';
import 'package:coolmovies/features/rating/presenter/controllers/movie_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../widgets/buttons_menu.dart';
import '../widgets/movie_info.dart';
import '../widgets/other_reviews_preview.dart';
import '../widgets/write_review.dart';

class MovieDetailsPage extends StatefulWidget {
  const MovieDetailsPage(
      {super.key, required this.controller, required this.id});

  final MovieDetailsController controller;
  final String id;

  @override
  State<MovieDetailsPage> createState() => _MovieDetailsPageState();
}

class _MovieDetailsPageState extends State<MovieDetailsPage> {
  late final String? userId;

  @override
  void initState() {
    widget.controller.movieDetailsState.addListener(listenableErrorState);
    widget.controller.createCommentState.addListener(listenableErrorState);
    widget.controller.getId().then((value) => userId = value);
    widget.controller.searchMovieDetails(widget.id);

    super.initState();
  }

  void listenableErrorState() {
    final movieDetailsState = widget.controller.movieDetailsState.value;
    final reviewState = widget.controller.movieDetailsState.value;

    if (movieDetailsState is ErrorState || reviewState is ErrorState) {
      Modular.to.pushNamed(
        MainRoutes.defaultError.route,
        arguments: ErrorPageParams(
          errorlog: movieDetailsState is ErrorState
              ? movieDetailsState.asError.message
              : reviewState.asError.message,
          onButtonPressed: (_) {
            widget.controller.searchMovieDetails(widget.id);
          },
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CoolMoviesAppBar(),
      body: ValueListenableBuilder<PageState<MovieDetailsEntity>>(
        valueListenable: widget.controller.movieDetailsState,
        builder: (context, state, _) {
          if (state is SuccessState) {
            final entity = state.asSuccess;
            return Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20, bottom: 20),
                      child: MovieInfo(entity: entity),
                    ),
                    ValueListenableBuilder<bool>(
                      valueListenable: widget.controller.visibility,
                      builder: (context, value, child) => Column(
                        children: [
                          Visibility(
                            visible: !value,
                            child: WriteReview(controller: widget.controller),
                          ),
                          Visibility(
                            visible: value,
                            child: ButtonsMenu(
                              controller: widget.controller,
                              entity: entity,
                            ),
                          ),
                          Visibility(
                            visible: !value,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                RatingBar.builder(
                                  initialRating: 3,
                                  itemSize: 35,
                                  minRating: 1,
                                  direction: Axis.horizontal,
                                  itemCount: 5,
                                  itemBuilder: (context, _) => const Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                  ),
                                  onRatingUpdate: (rating) {
                                    widget.controller.rating = rating.toInt();
                                  },
                                ),
                              ],
                            ),
                          ),
                          Visibility(
                            visible: !value,
                            child: CoolMoviesTextField(
                              hintText: 'Title',
                              controller: widget.controller.title,
                            ),
                          ),
                          Visibility(
                            visible: !value,
                            child: CoolMoviesTextField(
                              controller: widget.controller.body,
                              hintText: 'Review details',
                              maxLines: null,
                              height: 150,
                            ),
                          ),
                          Visibility(
                            visible: !value,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 16),
                              child: PrimaryButton(
                                title: 'Post',
                                onTap: () {
                                  widget.controller.createReview(
                                    state.asSuccess.movieId,
                                    state.asSuccess.movieReviewsByMovieId,
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(top: 32, bottom: 16),
                          child: Row(
                            children: [
                              CoolMoviesText(
                                text: 'Previous Reviews :',
                                size: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ],
                          ),
                        ),
                        OtherReviewsPreview(
                          entity: entity,
                          id: userId!,
                          confirmDismiss: (direction) async {
                            if (direction == DismissDirection.endToStart) {
                              return true;
                            }
                            return false;
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          } else {
            return const CoolMoviesLoading();
          }
        },
      ),
    );
  }
}
