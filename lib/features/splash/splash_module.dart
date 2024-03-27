import 'package:flutter_modular/flutter_modular.dart';

import 'presenter/page/splash_page.dart';
import 'splash_routes.dart';

class SplashModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          SplashRoutes.splashPage.route,
          child: (context, _) => const SplashPage(),
        ),
      ];
}
