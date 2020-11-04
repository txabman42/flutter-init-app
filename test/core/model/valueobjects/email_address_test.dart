import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:trickster/core/model/valueobjects/email_address.dart';
import 'package:trickster/core/model/valueobjects/value_object.dart';

void main() {
  test('should be a subclass of ValueObject entity', () {
    final tEmailAddress = EmailAddress("random@email.com");
    expect(tEmailAddress, isA<ValueObject>());
  });

  group('constructor', () {
    test('should return a valid model when input is a valid password', () {
      const input = "random@email.com";
      final password = EmailAddress(input);
      expect(password.value, const Right(input));
    });

    test('should return an assert exception when input is null', () {
      expect(() {
        EmailAddress(null);
      }, throwsA(isA<AssertionError>()));
    });
  });
}
