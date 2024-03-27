import '../../core/main_routes.dart';

enum LoginRoutes {
  loginPage('/');

  const LoginRoutes(this.route);

  final String route;

  String get path => MainRoutes.login.route + route;
}
