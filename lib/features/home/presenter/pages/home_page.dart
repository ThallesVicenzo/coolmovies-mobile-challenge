import 'package:app_design/app_bar/cool_movies_app_bar.dart';
import 'package:app_design/pages/default_erro_page.dart';
import 'package:app_design/widgets/loading/cool_movies_loading.dart';
import 'package:coolmovies/core/main_routes.dart';
import 'package:coolmovies/core/page_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../domain/entities/home_entity.dart';
import '../controller/home_controller.dart';
import '../widgets/home_dialog.dart';
import '../widgets/movies_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.controller});

  final HomeController controller;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    widget.controller.state.addListener(listenableErrorState);
    widget.controller.callMoviesList();
    super.initState();
  }

  void listenableErrorState() {
    final state = widget.controller.state.value;

    if (state is ErrorState) {
      Modular.to.pushNamed(
        MainRoutes.defaultError.route,
        arguments: ErrorPageParams(
          errorlog: state.asError.message,
          onButtonPressed: (_) {
            widget.controller.callMoviesList();
          },
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CoolMoviesAppBar(
        leading: () {
          showDialog(
            context: context,
            builder: (context) => HomeDialog(
              onPressed: () {
                widget.controller.logout();
              },
            ),
          );
        },
      ),
      body: SafeArea(
        child: ValueListenableBuilder<PageState<List<HomeEntity>>>(
          valueListenable: widget.controller.state,
          builder: (context, state, _) {
            if (state is SuccessState) {
              return GridView.builder(
                padding: const EdgeInsets.only(left: 16, top: 16),
                itemCount: state.asSuccess.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, childAspectRatio: 0.5),
                itemBuilder: (context, index) {
                  final movie = state.asSuccess[index];
                  return MoviesView(movie: movie);
                },
              );
            } else {
              return const CoolMoviesLoading();
            }
          },
        ),
      ),
    );
  }
}
