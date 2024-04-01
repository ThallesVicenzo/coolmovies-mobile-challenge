import 'dart:async';

import 'package:coolmovies/core/main_routes.dart';
import 'package:coolmovies/core/secure_storage/keys/secure_storage_keys.dart';
import 'package:coolmovies/core/secure_storage/secure_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SplashController extends ChangeNotifier {
  final SecureStorage secureStorage;

  SplashController({required this.secureStorage});

  final value = ValueNotifier<double>(1);

  Future<String?> retrieveName() async {
    final savedName = await secureStorage.read(key: SecureStorageKeys.name.key);
    Timer(const Duration(milliseconds: 1000), () {
      value.value = 0;
    });

    return savedName;
  }

  void splashAnimation(double value, String? savedName) {
    if (value == 0) {
      if (savedName == null) {
        Modular.to.navigate(MainRoutes.login.route);
      } else {
        Modular.to.navigate(MainRoutes.home.route);
      }
    }
  }
}
