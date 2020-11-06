
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_exception.freezed.dart';

@freezed
abstract class AuthException with _$AuthException {
  const factory AuthException.cancelledByUser() = CancelledByUser;
  const factory AuthException.serverError() = ServerError;
  const factory AuthException.emailAlreadyInUse() = EmailAlreadyInUse;
  const factory AuthException.userNotFound() = UserNotFound;
  const factory AuthException.invalidEmailAndPasswordCombination() =
      InvalidEmailAndPasswordCombination;
}
