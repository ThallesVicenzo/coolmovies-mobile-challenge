import 'package:coolmovies/core/exception/default_error.dart';
import 'package:coolmovies/core/response.dart';
import 'package:coolmovies/features/home/domain/entities/home_entity.dart';
import 'package:coolmovies/features/home/domain/repository/home_repository.dart';

abstract class HomeUseCase {
  Future<Response<DefaultError, List<HomeEntity>>> call();
}

class HomeUseCaseImp implements HomeUseCase {
  final HomeRepository repository;

  const HomeUseCaseImp({required this.repository});

  @override
  Future<Response<DefaultError, List<HomeEntity>>> call() async {
    return await repository.fetchData();
  }
}
