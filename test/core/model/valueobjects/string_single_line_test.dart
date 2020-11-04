import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:trickster/core/model/valueobjects/string_single_line.dart';
import 'package:trickster/core/model/valueobjects/value_object.dart';

void main() {
  test('should be a subclass of ValueObject entity', () {
    final tStringLine = StringSingleLine("randomText");
    expect(tStringLine, isA<ValueObject>());
  });

  group('constructor', () {
    test('should return a valid model when input is a single line', () {
      const input = "randomText";
      final stringLine = StringSingleLine(input);
      expect(stringLine.value, right(input));
    });

    test('should return an assert exception when input is null', () {
      expect(() {
        StringSingleLine(null);
      }, throwsA(isA<AssertionError>()));
    });
  });
}
