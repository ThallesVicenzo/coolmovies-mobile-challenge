import 'package:coolmovies/core/exception/default_error.dart';
import 'package:coolmovies/core/response.dart';

import '../../../../core/domain/entities/user_entity.dart';

abstract class LoginRepository {
  Future<Response<DefaultError, UserEntity>> call(String name);
}
