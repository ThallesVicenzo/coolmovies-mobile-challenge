import '../../core/main_routes.dart';

enum RatingRoutes {
  movieDetails('/');

  const RatingRoutes(this.route);

  final String route;

  String get path => MainRoutes.rating.route + route;
}
