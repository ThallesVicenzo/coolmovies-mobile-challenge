import 'package:coolmovies/features/splash/presenter/controller/splash_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'presenter/page/splash_page.dart';
import 'splash_routes.dart';

class SplashModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.factory<SplashController>(
          (i) => SplashController(
            secureStorage: i(),
          ),
        )
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          SplashRoutes.splashPage.route,
          child: (context, _) =>
              SplashPage(controller: context.read<SplashController>()),
        ),
      ];
}
