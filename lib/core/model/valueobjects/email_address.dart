import 'package:dartz/dartz.dart';
import 'package:trickster/core/error/exceptions.dart';
import 'package:trickster/core/model/valueobjects/value_object.dart';
import 'package:trickster/core/utils/validators/value_validators.dart';

class EmailAddress extends ValueObject<String> {
  @override
  final Either<ValueException<String>, String> value;

  factory EmailAddress(String input) {
    assert(input != null);
    return EmailAddress._(
      validateEmailAddress(input),
    );
  }

  const EmailAddress._(this.value);
}