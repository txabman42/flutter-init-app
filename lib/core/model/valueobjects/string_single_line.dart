import 'package:dartz/dartz.dart';
import 'package:trickster/core/error/exceptions.dart';
import 'package:trickster/core/model/valueobjects/value_object.dart';
import 'package:trickster/core/utils/validators/value_validators.dart';

class StringSingleLine extends ValueObject<String> {
  @override
  final Either<ValueException<String>, String> value;

  factory StringSingleLine(String input) {
    assert(input != null);
    return StringSingleLine._(
      validateSingleLine(input),
    );
  }

  const StringSingleLine._(this.value);
}