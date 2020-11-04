import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kt_dart/kt.dart';
import 'package:trickster/core/error/exceptions.dart';
import 'package:trickster/core/utils/validators/value_validators.dart';

void main() {
  group('validateMaxStringLength', () {
    const maxLength = 10;

    test('should return input when input is less or equalt to maxLength', () {
      final List<String> inputs = List(2);
      inputs[0] = "text";
      inputs[1] = "randomText";

      for (final String input in inputs) {
        final result = validateMaxStringLength(input, maxLength);
        expect(result, Right(input));
      }
    });

    test(
        'should return exceedingLength valueException when input is bigger than the maxLength',
        () {
      const String input = "random large invalid text";
      final result = validateMaxStringLength(input, maxLength);
      expect(
          result,
          const Left(ValueException.exceedingLength(
              failedValue: input, max: maxLength)));
    });
  });

  group('validateStringNotEmpty', () {
    test('should return input when input is not empty', () {
      const String input = "random text";
      final result = validateStringNotEmpty(input);
      expect(result, const Right(input));
    });

    test('should return empty valueException when input is empty', () {
      const String input = "";
      final result = validateStringNotEmpty(input);
      expect(result, const Left(ValueException.empty(failedValue: input)));
    });
  });

  group('validateSingleLine', () {
    test('should return input when input is single line', () {
      const String input = "random text";
      final result = validateSingleLine(input);
      expect(result, const Right(input));
    });

    test('should return multiline valueException when input is multiline', () {
      const String input = "random\ntext";
      final result = validateSingleLine(input);
      expect(result, const Left(ValueException.multiline(failedValue: input)));
    });
  });

  group('validateMaxListLength', () {
    const maxLength = 3;

    test('should return input list when length is less or equal to maxLength',
        () {
      final List<KtList<String>> inputs = List(2);
      inputs[0] = KtList.of("random1", "random2");
      inputs[1] = KtList.of("random1", "random2", "random3");

      for (final KtList<String> input in inputs) {
        final result = validateMaxListLength(input, maxLength);
        expect(result, Right(input));
      }
    });

    test(
        'should return listTooLong valueException when length is bigger than maxLength',
        () {
      final KtList<String> input =
          KtList.of("random1", "random2", "random3", "random4");
      final result = validateMaxListLength(input, maxLength);
      expect(result,
          Left(ValueException.listTooLong(failedValue: input, max: maxLength)));
    });
  });

  group('validateEmailAddress', () {
    test('should return input when is a valid email', () {
      const String input = "random@email.com";
      final result = validateEmailAddress(input);
      expect(result, const Right(input));
    });

    test('should return invalidEmail valueException when is a valid email', () {
      const String input = "random";
      final result = validateEmailAddress(input);
      expect(
          result, const Left(ValueException.invalidEmail(failedValue: input)));
    });
  });

  group('validatePassword', () {
    test('should return input when is a valid password', () {
      final List<String> inputs = List(2);
      inputs[0] = "randomPassword";
      inputs[1] = "random";

      for (final String input in inputs) {
        final result = validatePassword(input);
        expect(result, Right(input));
      }
    });

    test(
        'should return validatePassword valueException when is an invalid password',
        () {
      const String input = "test";
      final result = validatePassword(input);
      expect(
          result, const Left(ValueException.shortPassword(failedValue: input)));
    });
  });

  group('validatePhoneNumber', () {
    test('should return input when is a valid phoneNumber', () {
      final List<String> inputs = List(7);
      inputs[0] = "0971234567";
      inputs[1] = "+84 0971234567";
      inputs[2] = "+84 971234567";
      inputs[3] = "+840971234567";
      inputs[4] = "+84971234567";
      inputs[5] = "0971234567";
      inputs[6] = "971234567";

      for (final String input in inputs) {
        final result = validatePhoneNumber(input);
        expect(result, Right(input));
      }
    });

    test(
        'should return invalidPhoneNumber valueException when is an invalid phone number',
        () {
      const String input = "1234";
      final result = validatePhoneNumber(input);
      expect(result,
          const Left(ValueException.invalidPhoneNumber(failedValue: input)));
    });
  });
}
