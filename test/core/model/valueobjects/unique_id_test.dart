import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:trickster/core/model/valueobjects/unique_id.dart';
import 'package:trickster/core/model/valueobjects/value_object.dart';

void main() {
  test('should be a subclass of ValueObject entity', () {
    final tUniqueId = UniqueId();
    expect(tUniqueId, isA<ValueObject>());
  });

  group('constructor', () {
    test('should return a unique id when called the constructor', () {
      final tUniqueId = UniqueId();
      expect(tUniqueId.value, isNotNull);
    });
  });

  group('fromUniqueString', () {
    test(
        'should return UniqueId with input value when input value is valid uniqueId string',
        () {
      const inputStr = "random text";
      final uniqueId = UniqueId.fromUniqueString(inputStr);
      expect(uniqueId.value, const Right(inputStr));
    });

    test('should return assertion error when input is null', () {
      expect(() {
        UniqueId.fromUniqueString(null);
      }, throwsA(isA<AssertionError>()));
    });
  });
}
