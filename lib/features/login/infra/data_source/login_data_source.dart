import '../../../../core/domain/entities/user_entity.dart';

abstract class LoginDataSource {
  Future<UserEntity> call(String name);
}
