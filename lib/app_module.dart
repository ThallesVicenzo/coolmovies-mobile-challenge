import 'package:app_design/pages/default_erro_page.dart';
import 'package:coolmovies/core/secure_storage/secure_storage.dart';
import 'package:coolmovies/core/secure_storage/secure_storage_impl.dart';
import 'package:coolmovies/core/service/graphql_service.dart';
import 'package:coolmovies/features/home/home_module.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import 'core/main_routes.dart';
import 'features/login/login_module.dart';
import 'features/splash/splash_module.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.singleton<GraphQLClient>(
          (i) => GraphQLClient(
            link: ClientService.httpLink,
            cache: GraphQLCache(
              store: InMemoryStore(),
            ),
          ),
        ),
        Bind.singleton<SecureStorage>(
          (i) => SecureStorageImpl(),
        ),
      ];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute(
          MainRoutes.splash.route,
          module: SplashModule(),
        ),
        ModuleRoute(
          MainRoutes.login.route,
          module: LoginModule(),
        ),
        ModuleRoute(
          MainRoutes.home.route,
          module: HomeModule(),
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
