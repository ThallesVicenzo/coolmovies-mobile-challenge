import 'package:coolmovies/features/home/domain/entities/home_entity.dart';

abstract class HomeDataSource {
  Future<List<HomeEntity>> fetchData();
}
