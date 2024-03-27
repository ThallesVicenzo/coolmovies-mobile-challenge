import 'package:coolmovies/core/response.dart';

import '../entities/login_entity.dart';

abstract class LoginRepository {
  Future<Response<Exception, LoginEntity>> call(String name);
}
