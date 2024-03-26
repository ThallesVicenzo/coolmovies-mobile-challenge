import 'package:app_design/widgets/colors_palette.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.title,
    required this.onTap,
    this.size = const Size(double.infinity, 24),
  });

  final String title;
  final Function() onTap;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: size.height,
        width: size.width,
        decoration: BoxDecoration(
          color: ColorsPalette.saffron,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Center(
          child: Text(
            title,
            style: const TextStyle(
              color: ColorsPalette.marfim,
            ),
          ),
        ),
      ),
    );
  }
}
