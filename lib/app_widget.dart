import 'package:app_design/widgets/colors_palette.dart';
import 'package:app_design/widgets/ui_overlay_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'core/main_routes.dart';

class CoolMovies extends StatelessWidget {
  const CoolMovies({super.key});

  @override
  Widget build(BuildContext context) {
    Modular.setInitialRoute(MainRoutes.splash.route);
    return MaterialApp.router(
      title: 'Cool Movies',
      debugShowCheckedModeBanner: false,
      routeInformationParser: Modular.routeInformationParser,
      routerDelegate: Modular.routerDelegate,
      theme: ThemeData(
        scaffoldBackgroundColor: ColorsPalette.backgroundColor,
      ),
      builder: (context, child) {
        return UiOverlayColor(
          child: child!,
        );
      },
    );
  }
}
