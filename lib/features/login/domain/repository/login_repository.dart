import 'package:coolmovies/core/exception/default_error.dart';
import 'package:coolmovies/core/response.dart';

import '../entities/login_entity.dart';

abstract class LoginRepository {
  Future<Response<DefaultError, LoginEntity>> call(String name);
}
