import 'package:coolmovies/core/response.dart';

import '../entities/login_entity.dart';
import '../repository/login_repository.dart';

abstract class LoginUseCase {
  Future<Response<Exception, LoginEntity>> call(String name);
}

class LoginUseCaseImp implements LoginUseCase {
  final LoginRepository repository;

  const LoginUseCaseImp({required this.repository});

  @override
  Future<Response<Exception, LoginEntity>> call(String name) async {
    return await repository.call(name);
  }
}
