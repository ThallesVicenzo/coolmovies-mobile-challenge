import 'dart:io';

enum AppImage {
  logo('logo.png'),
  errorGif('error-image.gif');

  const AppImage(this.name);

  final String name;

  String get _defaultPath => 'assets/images/';

  String get path => '$_defaultPath$name';

  File get file => File(path);
}
