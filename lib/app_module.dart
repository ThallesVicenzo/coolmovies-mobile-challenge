import 'package:app_design/pages/default_erro_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'core/main_routes.dart';
import 'features/splash/splash_module.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute(
          MainRoutes.splash.route,
          module: SplashModule(),
        ),
        ChildRoute(
          MainRoutes.defaultError.route,
          child: (context, args) {
            final erroParams = args.data is ErrorPageParams
                ? (args.data as ErrorPageParams)
                : const ErrorPageParams();
            return DefaultErrorPage(
              params: erroParams,
              onBackStart: () {
                Modular.to.navigate(MainRoutes.home.route);
              },
            );
          },
        ),
      ];
}
