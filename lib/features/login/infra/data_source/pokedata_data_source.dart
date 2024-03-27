import '../../domain/entities/login_entity.dart';

abstract class LoginDataSource {
  Future<LoginEntity> call(String name);
}
