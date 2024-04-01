import 'package:coolmovies/core/domain/entities/user_entity.dart';
import 'package:coolmovies/core/map_extensions.dart';

class LoginModel extends UserEntity {
  LoginModel({required super.name, required super.id});

  factory LoginModel.fromJson(Map<String, dynamic>? json) {
    return LoginModel(
      name: json!.getValue('name'),
      id: json.getValue('id'),
    );
  }
}
