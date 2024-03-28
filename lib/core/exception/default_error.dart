import 'package:coolmovies/core/domain/error.dart';

class DefaultError extends FailureError {
  const DefaultError([String? message]) : super(message);
}
