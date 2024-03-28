import 'package:coolmovies/features/login/domain/entities/login_entity.dart';

class LoginModel extends LoginEntity {
  LoginModel({required super.name});

  factory LoginModel.fromJson(Map<String, dynamic>? json) {
    return LoginModel(
      name: json?['name'] ?? '',
    );
  }
}
