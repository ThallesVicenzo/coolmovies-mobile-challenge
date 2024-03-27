import 'dart:async';

import 'package:app_design/app_images.dart';
import 'package:app_design/widgets/colors_palette.dart';
import 'package:app_design/widgets/image_widget.dart';
import 'package:coolmovies/core/main_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashScreen();
}

class _SplashScreen extends State<SplashPage> {
  double value = 1;

  @override
  void initState() {
    Timer(const Duration(milliseconds: 1500), () {
      setState(() {
        value = 0;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedOpacity(
        opacity: value,
        duration: kThemeAnimationDuration,
        onEnd: () {
          if (value == 0) {
            Modular.to.navigate(
              MainRoutes.login.route,
            );
          }
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
    );
  }
}
