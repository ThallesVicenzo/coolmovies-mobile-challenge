import 'package:coolmovies/features/home/domain/repository/home_repository.dart';
import 'package:coolmovies/features/home/domain/usecases/home_usecase.dart';
import 'package:coolmovies/features/home/external/home_data_source_impl.dart';
import 'package:coolmovies/features/home/home_routes.dart';
import 'package:coolmovies/features/home/infra/data_source/home_data_source.dart';
import 'package:coolmovies/features/home/infra/repository/home_repository.dart';
import 'package:coolmovies/features/home/presenter/pages/home_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'presenter/controller/home_controller.dart';

class HomeModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.factory<HomeDataSource>(
          (i) => HomeDataSourceImpl(
            client: i(),
          ),
        ),
        Bind.factory<HomeUseCase>(
          (i) => HomeUseCaseImp(
            repository: i<HomeRepository>(),
          ),
        ),
        Bind.factory<HomeRepository>(
          (i) => HomeRepositoryImp(
            dataSource: i<HomeDataSource>(),
          ),
        ),
        Bind.factory<HomeController>(
          (i) => HomeController(
            useCase: i<HomeUseCase>(),
          ),
        ),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          HomeRoutes.homePage.route,
          child: (context, _) => HomePage(
            controller: context.read<HomeController>(),
          ),
        ),
      ];
}
