import 'package:app_design/widgets/colors/colors_palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class UiOverlayColor extends StatelessWidget {
  const UiOverlayColor(
      {super.key, required this.child, this.overlayColor, this.brightness});

  final Widget child;
  final Color? overlayColor;
  final Brightness? brightness;

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: overlayColor ?? ColorsPalette.backgroundColor,
        statusBarIconBrightness: brightness ?? Brightness.light,
      ),
      child: child,
    );
  }
}
