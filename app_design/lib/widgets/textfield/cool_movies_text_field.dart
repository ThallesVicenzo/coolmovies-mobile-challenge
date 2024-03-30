import 'package:flutter/material.dart';

import '../../utils/values/finals.dart';
import '../colors/colors_palette.dart';
import '../text/cool_movies_text.dart';

class CoolMoviesTextField extends StatelessWidget {
  const CoolMoviesTextField({
    super.key,
    required this.controller,
    this.label,
    this.hintText,
    this.height,
    this.validator,
    this.errorText,
  });

  final String? label;
  final String? hintText;
  final String? errorText;
  final double? height;
  final TextEditingController controller;
  final String Function(String?)? validator;

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
        TextFormField(
          controller: controller,
          style: const TextStyle(color: ColorsPalette.marfim),
          cursorColor: ColorsPalette.marfim,
          validator: validator,
          decoration: InputDecoration(
            errorText: errorText ?? 'Please type something!',
            errorBorder: outlineBorder,
            border: outlineBorder,
            constraints: BoxConstraints(maxHeight: height ?? 72),
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
