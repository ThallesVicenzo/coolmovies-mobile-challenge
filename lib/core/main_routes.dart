enum MainRoutes {
  splash('/splash'),
  login('/login'),
  home('/home'),
  rating('/rating'),
  defaultError('/defaultErrorPage');

  const MainRoutes(this.route);

  final String route;
}
