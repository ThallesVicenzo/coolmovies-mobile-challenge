import 'package:app_design/app_bar/cool_movies_app_bar.dart';
import 'package:app_design/widgets/colors/colors_palette.dart';
import 'package:app_design/widgets/text/cool_movies_text.dart';
import 'package:coolmovies/features/rating/domain/entity/movie_reviews.dart';
import 'package:flutter/material.dart';

class AllReviewsPage extends StatefulWidget {
  const AllReviewsPage({super.key, required this.entity});

  final List<MovieReviewsEntity> entity;

  @override
  State<AllReviewsPage> createState() => _AllReviewsPageState();
}

class _AllReviewsPageState extends State<AllReviewsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CoolMoviesAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: widget.entity.length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: ColorsPalette.marfim),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CoolMoviesText(
                              text: widget.entity[index].title,
                              size: 16,
                              fontWeight: FontWeight.w700,
                            ),
                            CoolMoviesText(
                              text: '${widget.entity[index].rating}/5',
                              size: 16,
                              fontWeight: FontWeight.w700,
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: CoolMoviesText(
                            text: widget.entity[index].user.name,
                            size: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        CoolMoviesText(
                          text: widget.entity[index].body,
                          size: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
