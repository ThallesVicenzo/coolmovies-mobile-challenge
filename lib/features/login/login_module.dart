import 'package:coolmovies/features/login/domain/repository/login_repository.dart';
import 'package:coolmovies/features/login/domain/usecases/login_usecase.dart';
import 'package:coolmovies/features/login/external/login_data_source_imp.dart';
import 'package:coolmovies/features/login/infra/repository/login_repository_imp.dart';
import 'package:coolmovies/features/login/login_routes.dart';
import 'package:coolmovies/features/login/presenter/controller/login_controller.dart';
import 'package:coolmovies/features/login/presenter/pages/login_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'infra/data_source/pokedata_data_source.dart';

class LoginModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.factory<LoginDataSource>(
          (i) => LoginDataSourceImpl(
            client: i(),
          ),
        ),
        Bind.factory<LoginRepository>(
          (i) => LoginRepositoryImp(
            dataSource: i<LoginDataSource>(),
          ),
        ),
        Bind.factory<LoginUseCase>(
          (i) => LoginUseCaseImp(
            repository: i<LoginRepository>(),
          ),
        ),
        Bind.factory<LoginController>(
          (i) => LoginController(
            useCase: i<LoginUseCase>(),
          ),
        ),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          LoginRoutes.loginPage.route,
          child: (context, _) => LoginPage(
            controller: context.read<LoginController>(),
          ),
        ),
      ];
}
