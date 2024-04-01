import 'package:coolmovies/core/exception/default_error.dart';
import 'package:coolmovies/core/response.dart';

import '../../../../core/domain/entities/user_entity.dart';
import '../repository/login_repository.dart';

abstract class LoginUseCase {
  Future<Response<DefaultError, UserEntity>> call(String name);
}

class LoginUseCaseImp implements LoginUseCase {
  final LoginRepository repository;

  const LoginUseCaseImp({required this.repository});

  @override
  Future<Response<DefaultError, UserEntity>> call(String name) async {
    return await repository.call(name);
  }
}
