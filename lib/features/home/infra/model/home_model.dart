import 'package:coolmovies/core/map_extensions.dart';
import 'package:coolmovies/features/home/domain/entities/home_entity.dart';

class HomeModel extends HomeEntity {
  HomeModel({
    required super.id,
    required super.name,
    required super.imgUrl,
  });

  factory HomeModel.fromJson(Map<String, dynamic> json) {
    return HomeModel(
      id: json.getValue('id'),
      name: json.getValue('title'),
      imgUrl: json.getValue('imgUrl'),
    );
  }
}
