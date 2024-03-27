enum MainRoutes {
  splash('/splash'),
  login('/login'),
  home('/home'),
  defaultError('/defaultErrorPage');

  const MainRoutes(this.route);

  final String route;
}
