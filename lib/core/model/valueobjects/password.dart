import 'package:dartz/dartz.dart';
import 'package:trickster/core/error/exceptions.dart';
import 'package:trickster/core/model/valueobjects/value_object.dart';
import 'package:trickster/core/utils/validators/value_validators.dart';

class Password extends ValueObject<String> {
  @override
  final Either<ValueException<String>, String> value;

  factory Password(String input) {
    assert(input != null);
    return Password._(
      validatePassword(input),
    );
  }

  const Password._(this.value);
}
