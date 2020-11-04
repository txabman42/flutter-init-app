import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:trickster/core/model/valueobjects/phone_number.dart';
import 'package:trickster/core/model/valueobjects/value_object.dart';

void main() {
  test('should be a subclass of ValueObject entity', () {
    final tPassword = PhoneNumber("123456789");
    expect(tPassword, isA<ValueObject>());
  });

  group('constructor', () {
    test('should return a valid model when input is a valid phoneNumber', () {
      const input = "123456789";
      final password = PhoneNumber(input);
      expect(password.value, const Right(input));
    });

    test('should return an assert exception when input is null', () {
      expect(() {
        PhoneNumber(null);
      }, throwsA(isA<AssertionError>()));
    });
  });
}
