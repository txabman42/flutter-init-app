import 'package:trickster/core/error/exceptions.dart';

class NotAuthenticatedError extends Error {}

class UnexpectedValueError extends Error {
  final ValueException valueException;

  UnexpectedValueError(this.valueException);

  @override
  String toString() {
    const explanation =
        'Encountered a ValueException at an unrecoverable point. Terminating.';
    return Error.safeToString('$explanation Failure was: $valueException');
  }
}
