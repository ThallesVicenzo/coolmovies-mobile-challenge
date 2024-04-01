import 'package:app_design/widgets/colors/colors_palette.dart';
import 'package:app_design/widgets/text/cool_movies_text.dart';
import 'package:coolmovies/core/main_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeDialog extends StatelessWidget {
  const HomeDialog({
    super.key,
    this.onPressed,
  });

  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: ColorsPalette.saffron,
      title: const CoolMoviesText(
        text: 'Do you want to logout?',
        fontWeight: FontWeight.w700,
        size: 24,
      ),
      actions: [
        TextButton(
          onPressed: onPressed ??
              () {
                Modular.to.navigate(MainRoutes.login.route);
              },
          child: const CoolMoviesText(
            text: 'Yes',
            fontWeight: FontWeight.w500,
            size: 16,
          ),
        ),
        TextButton(
          onPressed: () {
            Modular.to.pop();
          },
          child: const CoolMoviesText(
            text: 'No',
            fontWeight: FontWeight.w500,
            size: 16,
          ),
        ),
      ],
    );
  }
}
