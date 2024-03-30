import 'package:app_design/enums/app_images.dart';
import 'package:app_design/pages/default_erro_page.dart';
import 'package:app_design/widgets/buttons/primary_button.dart';
import 'package:app_design/widgets/colors/colors_palette.dart';
import 'package:app_design/widgets/image/image_widget.dart';
import 'package:app_design/widgets/text/cool_movies_text.dart';
import 'package:app_design/widgets/textfield/cool_movies_text_field.dart';
import 'package:coolmovies/core/main_routes.dart';
import 'package:coolmovies/core/page_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../controller/sign_in_controller.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key, required this.controller});

  final SignInController controller;

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  void initState() {
    widget.controller.state.addListener(listenableErrorState);
    widget.controller.validateForm();
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
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          child: ValueListenableBuilder(
            valueListenable: widget.controller.state,
            builder: (context, state, _) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 46),
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 48, bottom: 46),
                      child: Center(
                        child: ImageWidget(
                          image: AppImage.logo,
                          size: Size(200, 200),
                        ),
                      ),
                    ),
                    const CoolMoviesText(
                      text: 'Sign in',
                      size: 24,
                      fontWeight: FontWeight.bold,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20, bottom: 32),
                      child: CoolMoviesTextField(
                        label: 'Name :',
                        hintText: 'Kowalski',
                        controller: widget.controller.textEditingController,
                        onChanged: (p0) {
                          widget.controller.validateForm();
                        },
                      ),
                    ),
                    Visibility(
                      visible: state != LoadingState,
                      replacement: const CoolMoviesLoading(),
                      child: ValueListenableBuilder<bool>(
                        valueListenable: widget.controller.absorb,
                        builder: (context, value, _) => AbsorbPointer(
                          absorbing: value,
                          child: PrimaryButton(
                            title: 'Create Account',
                            color: value
                                ? ColorsPalette.normalGray
                                : ColorsPalette.saffron,
                            onTap: () {
                              widget.controller.createAccount(
                                widget.controller.textEditingController.text,
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class CoolMoviesLoading extends StatelessWidget {
  const CoolMoviesLoading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const CircularProgressIndicator(
      color: ColorsPalette.marfim,
    );
  }
}
