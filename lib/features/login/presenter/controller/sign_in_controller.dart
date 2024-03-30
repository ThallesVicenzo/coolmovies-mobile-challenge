import 'package:coolmovies/core/main_routes.dart';
import 'package:coolmovies/core/page_state.dart';
import 'package:coolmovies/core/secure_storage/secure_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../domain/entities/login_entity.dart';
import '../../domain/usecases/login_usecase.dart';

class SignInController extends ChangeNotifier {
  final LoginUseCase useCase;
  final SecureStorage secureStorage;

  SignInController({
    required this.useCase,
    required this.secureStorage,
  });

  final state = ValueNotifier<PageState<LoginEntity>>(InitialState());

  final TextEditingController textEditingController = TextEditingController();

  final absorb = ValueNotifier<bool>(false);

  void validateForm() {
    absorb.value = false;
    if (textEditingController.text.isEmpty) {
      absorb.value = true;
      notifyListeners();
    }
    if (textEditingController.text.length > 10) {
      absorb.value = true;
      notifyListeners();
    }
  }

  Future<void> createAccount(String name) async {
    state.value = LoadingState();
    final result = await useCase.call(name);
    result.deal(
      onFail: (e) => state.value = ErrorState(error: e),
      onSuccess: (s) {
        secureStorage.write(key: 'username', value: s.name);
        Modular.to.navigate(MainRoutes.home.route);
      },
    );
  }
}
