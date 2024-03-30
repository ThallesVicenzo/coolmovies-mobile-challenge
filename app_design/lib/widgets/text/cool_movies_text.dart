import 'package:app_design/widgets/colors/colors_palette.dart';
import 'package:flutter/material.dart';

class CoolMoviesText extends StatelessWidget {
  const CoolMoviesText({
    super.key,
    required this.text,
    required this.size,
    this.fontWeight = FontWeight.normal,
  });

  final String text;
  final double size;
  final FontWeight fontWeight;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: ColorsPalette.marfim,
        fontWeight: fontWeight,
        fontSize: size,
      ),
    );
  }
}
