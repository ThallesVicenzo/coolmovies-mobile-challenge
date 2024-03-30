import 'package:app_design/widgets/colors/colors_palette.dart';
import 'package:app_design/widgets/text/cool_movies_text.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.title,
    required this.onTap,
    this.size = const Size(double.infinity, 36),
    this.color,
  });

  final String title;
  final Function() onTap;
  final Size size;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: size.height,
        width: size.width,
        decoration: BoxDecoration(
          color: color ?? ColorsPalette.saffron,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: CoolMoviesText(
            text: title,
            size: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
