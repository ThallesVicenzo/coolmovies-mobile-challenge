import 'package:app_design/widgets/colors/colors_palette.dart';
import 'package:flutter/material.dart';

class CoolMoviesLoading extends StatelessWidget {
  const CoolMoviesLoading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: CircularProgressIndicator(
            color: ColorsPalette.marfim,
          ),
        ),
      ],
    );
  }
}
