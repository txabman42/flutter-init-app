import 'package:dartz/dartz.dart';
import 'package:trickster/core/error/exceptions.dart';
import 'package:trickster/core/model/valueobjects/value_object.dart';
import 'package:trickster/core/utils/validators/value_validators.dart';

class PhoneNumber extends ValueObject<String> {
  @override
  final Either<ValueException<String>, String> value;

  factory PhoneNumber(String input) {
    assert(input != null);
    return PhoneNumber._(
      validatePhoneNumber(input),
    );
  }

  const PhoneNumber._(this.value);
}
