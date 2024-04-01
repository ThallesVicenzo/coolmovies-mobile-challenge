import 'package:flutter/material.dart';

import '../widgets/colors/colors_palette.dart';
import '../widgets/text/cool_movies_text.dart';

class CoolMoviesAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CoolMoviesAppBar({
    super.key,
    this.height = kToolbarHeight,
    this.leading,
  });

  final double height;
  final void Function()? leading;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const CoolMoviesText(text: 'Cool Movies App', size: 20),
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: ColorsPalette.marfim),
        onPressed: leading ??
            () {
              Navigator.pop(context);
            },
      ),
      backgroundColor: ColorsPalette.backgroundColor,
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
