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
    this.onChanged,
    this.maxLines = 1,
  });

  final String? label;
  final String? hintText;
  final String? errorText;
  final double? height;
  final int? maxLines;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Visibility(
          visible: label != null ? true : false,
          child: Row(
            children: [
              CoolMoviesText(
                text: label ?? '',
                size: 16,
                fontWeight: FontWeight.w500,
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        TextFormField(
          controller: controller,
          style: const TextStyle(color: ColorsPalette.marfim),
          cursorColor: ColorsPalette.marfim,
          maxLines: maxLines,
          expands: maxLines == null ? true : false,
          validator: validator,
          onChanged: onChanged,
          decoration: InputDecoration(
            errorText: errorText,
            isCollapsed: maxLines == null ? true : false,
            contentPadding: const EdgeInsets.all(8),
            errorBorder: outlineBorder,
            border: outlineBorder,
            constraints: BoxConstraints(maxHeight: height ?? 48),
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
