import '../../core/main_routes.dart';

enum RatingRoutes {
  movieDetails('/'),
  allReviews('/all-reviews');

  const RatingRoutes(this.route);

  final String route;

  String get path => MainRoutes.rating.route + route;
}
