import 'package:dartz/dartz.dart';
import 'package:kt_dart/kt.dart';
import 'package:trickster/core/error/exceptions.dart';

Either<ValueException<String>, String> validateMaxStringLength(
  String input,
  int maxLength,
) {
  if (input.length <= maxLength) {
    return right(input);
  } else {
    return left(
      ValueException.exceedingLength(failedValue: input, max: maxLength),
    );
  }
}

Either<ValueException<String>, String> validateStringNotEmpty(String input) {
  if (input.isNotEmpty) {
    return right(input);
  } else {
    return left(ValueException.empty(failedValue: input));
  }
}

Either<ValueException<String>, String> validateSingleLine(String input) {
  if (input.contains('\n')) {
    return left(ValueException.multiline(failedValue: input));
  } else {
    return right(input);
  }
}

Either<ValueException<KtList<T>>, KtList<T>> validateMaxListLength<T>(
  KtList<T> input,
  int maxLength,
) {
  if (input.size <= maxLength) {
    return right(input);
  } else {
    return left(ValueException.listTooLong(
      failedValue: input,
      max: maxLength,
    ));
  }
}

Either<ValueException<String>, String> validateEmailAddress(String input) {
  const emailRegex =
      r"""^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+""";
  if (RegExp(emailRegex).hasMatch(input)) {
    return right(input);
  } else {
    return left(ValueException.invalidEmail(failedValue: input));
  }
}

Either<ValueException<String>, String> validatePassword(String input) {
  if (input.length >= 6) {
    return right(input);
  } else {
    return left(ValueException.shortPassword(failedValue: input));
  }
}

Either<ValueException<String>, String> validatePhoneNumber(String input) {
  const phoneNumberRegex = r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$';
  if (RegExp(phoneNumberRegex).hasMatch(input) && input.length >= 9) {
    return right(input);
  } else {
    return left(ValueException.invalidPhoneNumber(failedValue: input));
  }
}