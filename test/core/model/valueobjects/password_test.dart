import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:trickster/core/model/valueobjects/password.dart';
import 'package:trickster/core/model/valueobjects/value_object.dart';

void main() {
  test('should be a subclass of ValueObject entity', () {
    final tPassword = Password("randomPassword");
    expect(tPassword, isA<ValueObject>());
  });

  group('constructor', () {
    test('should return a valid model when input is a valid password', () {
      const input = "randomPassword";
      final password = Password(input);
      expect(password.value, const Right(input));
    });

    test('should return an assert exception when input is null', () {
      expect(() {
        Password(null);
      }, throwsA(isA<AssertionError>()));
    });
  });
}
