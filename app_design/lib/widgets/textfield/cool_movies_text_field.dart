import 'package:flutter/material.dart';

import '../../utils/values/finals.dart';
import '../colors_palette.dart';
import '../cool_movies_text.dart';

class CoolMoviesTextField extends StatelessWidget {
  const CoolMoviesTextField({
    super.key,
    this.label,
    this.hintText,
    required this.height,
    required this.controller,
  });

  final String? label;
  final String? hintText;
  final double height;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            CoolMoviesText(
              text: label ?? '',
              size: 16,
              fontWeight: FontWeight.w500,
            ),
          ],
        ),
        const SizedBox(
          height: 8,
        ),
        TextField(
          controller: controller,
          style: const TextStyle(color: ColorsPalette.marfim),
          cursorColor: ColorsPalette.marfim,
          decoration: InputDecoration(
            border: outlineBorder,
            constraints: BoxConstraints(maxHeight: height),
            hintText: hintText,
            hintStyle: TextStyle(color: ColorsPalette.marfim.withOpacity(0.5)),
            disabledBorder: outlineBorder,
            enabledBorder: outlineBorder,
            focusedBorder: outlineBorder,
          ),
        ),
      ],
    );
  }
}
