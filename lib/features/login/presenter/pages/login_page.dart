import 'package:app_design/enums/app_images.dart';
import 'package:app_design/pages/default_erro_page.dart';
import 'package:app_design/widgets/buttons/primary_button.dart';
import 'package:app_design/widgets/image/image_widget.dart';
import 'package:app_design/widgets/text/cool_movies_text.dart';
import 'package:app_design/widgets/textfield/cool_movies_text_field.dart';
import 'package:coolmovies/core/main_routes.dart';
import 'package:coolmovies/core/page_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../controller/login_controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key, required this.controller});

  final LoginController controller;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  void initState() {
    widget.controller.state.addListener(listenableErrorState);
    super.initState();
  }

  void listenableErrorState() {
    final state = widget.controller.state.value;

    if (state is ErrorState) {
      Modular.to.pushNamed(
        MainRoutes.defaultError.route,
        arguments: ErrorPageParams(
          errorlog: state.asError.message,
          onButtonPressed: (_) {},
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: widget.controller.state,
          builder: (context, state, _) {
            if (state is LoadingState) {
              return const CircularProgressIndicator();
            }
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 46),
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 64, bottom: 46),
                    child: Center(
                      child: ImageWidget(
                        image: AppImage.logo,
                        size: Size(200, 200),
                      ),
                    ),
                  ),
                  const CoolMoviesText(
                    text: 'Login',
                    size: 24,
                    fontWeight: FontWeight.bold,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: CoolMoviesTextField(
                      label: 'Name :',
                      hintText: 'Kowalski',
                      height: 48,
                      controller: TextEditingController(),
                    ),
                  ),
                  PrimaryButton(
                    title: 'Login',
                    onTap: () {},
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
