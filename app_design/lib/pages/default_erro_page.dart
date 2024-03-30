import 'package:app_design/enums/app_images.dart';
import 'package:app_design/widgets/buttons/primary_button.dart';
import 'package:app_design/widgets/colors/colors_palette.dart';
import 'package:app_design/widgets/colors/ui_overlay_color.dart';
import 'package:app_design/widgets/image/image_widget.dart';
import 'package:app_design/widgets/text/cool_movies_text.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ErrorPageParams {
  /// Title of error page
  final String titleError;

  /// Message of error page (optional) default: 'Tente novamente mais tarde.'
  final String messageError;

  /// Error log only for debug mode (optional) default: null
  final String? errorlog;

  /// Button title of error page (optional) default: 'Voltar'
  final String buttonErrorTitle;

  /// Function to be called when button is pressed (optional) default: Navigator.of(context).pop()
  final void Function(BuildContext context)? onButtonPressed;

  /// Code of error page (optional) default: null
  final String? code;

  /// Image of error page (optional) default: AppImage.pikachuError
  final AppImage image;

  /// Call pop when button is pressed or back button is pressed (optional) default: true
  final bool autoPop;

  const ErrorPageParams({
    this.titleError = 'Something went wrong',
    this.messageError = 'Try again later.',
    this.buttonErrorTitle = 'Try again',
    this.onButtonPressed,
    this.code,
    this.errorlog,
    this.image = AppImage.errorGif,
    this.autoPop = true,
  });

  ErrorPageParams copyWith({
    String? titleError,
    String? messageError,
    String? errorlog,
    String? buttonErrorTitle,
    void Function(BuildContext context)? onButtonPressed,
    String? code,
    AppImage? icon,
  }) {
    return ErrorPageParams(
      titleError: titleError ?? this.titleError,
      messageError: messageError ?? this.messageError,
      buttonErrorTitle: buttonErrorTitle ?? this.buttonErrorTitle,
      onButtonPressed: onButtonPressed ?? this.onButtonPressed,
      code: code ?? this.code,
      image: icon ?? image,
      errorlog: errorlog ?? this.errorlog,
    );
  }

  @override
  String toString() {
    return 'ErrorPageParams(titleError: $titleError, '
        'messageError: $messageError, '
        'errorlog: $errorlog, '
        'buttonErrorTitle: $buttonErrorTitle, '
        'onButtonPressed: $onButtonPressed, '
        'code: $code, '
        'image: $image, '
        'autoPop: $autoPop)';
  }
}

class DefaultErrorPage extends StatelessWidget {
  final ErrorPageParams params;
  final void Function() onBackStart;
  const DefaultErrorPage({
    super.key,
    this.params = const ErrorPageParams(),
    required this.onBackStart,
  });

  @override
  Widget build(BuildContext context) {
    return UiOverlayColor(
      overlayColor: Colors.black87,
      brightness: Brightness.light,
      child: PopScope(
        canPop: params.autoPop,
        onPopInvoked: (_) async {
          if (params.onButtonPressed == null) {
            Navigator.of(context).canPop()
                ? Navigator.of(context).pop()
                : Navigator.of(context).pushReplacementNamed('/');
          } else {
            params.onButtonPressed?.call(context);
          }
        },
        child: Scaffold(
          backgroundColor: ColorsPalette.backgroundColor,
          body: Center(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ImageWidget(
                    image: params.image,
                    size: const Size(300, 300),
                  ),
                  const SizedBox(height: 72),
                  Visibility(
                    visible: kDebugMode,
                    child: GestureDetector(
                      onTap: () async {
                        final scaffoldMessger = ScaffoldMessenger.of(context);
                        await Clipboard.setData(
                          ClipboardData(
                            text: params.toString(),
                          ),
                        );
                        scaffoldMessger.showSnackBar(
                          const SnackBar(
                            content: CoolMoviesText(
                              text: 'Copied to transfer area',
                              size: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        );
                      },
                      child: const Icon(
                        Icons.copy,
                        color: Colors.white,
                        size: 24,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  CoolMoviesText(
                    text: params.titleError,
                    size: 14,
                    fontWeight: FontWeight.w500,
                  ),
                  const SizedBox(height: 16),
                  CoolMoviesText(
                    text: params.messageError,
                    size: 14,
                    fontWeight: FontWeight.w500,
                  ),
                  const SizedBox(height: 16),
                  Visibility(
                    visible: params.code != null,
                    child: CoolMoviesText(
                      text: 'Code: ${params.code}',
                      size: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Visibility(
                    visible: kDebugMode && params.errorlog != null,
                    child: CoolMoviesText(
                      text: params.errorlog ?? '',
                      size: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 80),
                ],
              ),
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                PrimaryButton(
                  title: params.onButtonPressed == null
                      ? 'Go back'
                      : params.buttonErrorTitle,
                  onTap: () {
                    if (params.onButtonPressed == null) {
                      Navigator.of(context).canPop()
                          ? Navigator.of(context).pop()
                          : Navigator.of(context)
                              .popUntil((route) => route.isFirst);
                    } else {
                      params.autoPop ? Navigator.of(context).pop() : null;
                      params.onButtonPressed?.call(context);
                    }
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: GestureDetector(
                    onTap: onBackStart,
                    child: const CoolMoviesText(
                      text: 'Back to start',
                      size: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
