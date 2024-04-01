import 'package:app_design/enums/app_images.dart';
import 'package:app_design/widgets/colors/colors_palette.dart';
import 'package:app_design/widgets/image/image_widget.dart';
import 'package:coolmovies/features/splash/presenter/controller/splash_controller.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key, required this.controller});

  final SplashController controller;

  @override
  State<SplashPage> createState() => _SplashScreen();
}

class _SplashScreen extends State<SplashPage> {
  late final String? savedName;

  @override
  void initState() {
    widget.controller.retrieveName().then((value) => savedName = value);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder<double>(
        valueListenable: widget.controller.value,
        builder: (context, value, child) => AnimatedOpacity(
          opacity: value,
          duration: kThemeAnimationDuration,
          onEnd: () {
            widget.controller.splashAnimation(value, savedName);
          },
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: ImageWidget(
                  image: AppImage.logo,
                  size: Size(250, 250),
                ),
              ),
              Text(
                'Cool Movies',
                style: TextStyle(
                  color: ColorsPalette.marfim,
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
