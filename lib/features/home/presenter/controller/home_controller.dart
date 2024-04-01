import 'package:coolmovies/core/main_routes.dart';
import 'package:coolmovies/core/page_state.dart';
import 'package:coolmovies/core/secure_storage/keys/secure_storage_keys.dart';
import 'package:coolmovies/core/secure_storage/secure_storage.dart';
import 'package:coolmovies/features/home/domain/entities/home_entity.dart';
import 'package:coolmovies/features/home/domain/usecases/home_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeController extends ChangeNotifier {
  final HomeUseCase useCase;
  final SecureStorage secureStorage;

  HomeController({
    required this.useCase,
    required this.secureStorage,
  });

  final state = ValueNotifier<PageState<List<HomeEntity>>>(InitialState());

  void logout() async {
    await secureStorage.delete(key: SecureStorageKeys.name.key);
    Modular.to.navigate(MainRoutes.login.route);
  }

  void callMoviesList() async {
    state.value = LoadingState();
    final result = await useCase.call();

    result.deal(
      onFail: (failure) => state.value = ErrorState(error: failure),
      onSuccess: (success) => state.value = SuccessState(data: success),
    );
  }
}
