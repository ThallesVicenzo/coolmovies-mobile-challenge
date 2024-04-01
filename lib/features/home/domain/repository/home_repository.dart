import 'package:coolmovies/core/exception/default_error.dart';
import 'package:coolmovies/core/response.dart';
import 'package:coolmovies/features/home/domain/entities/home_entity.dart';

abstract class HomeRepository {
  Future<Response<DefaultError, List<HomeEntity>>> fetchData();
}
