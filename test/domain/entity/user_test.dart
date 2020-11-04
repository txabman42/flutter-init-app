import 'package:flutter_test/flutter_test.dart';
import 'package:trickster/core/model/valueobjects/email_address.dart';
import 'package:trickster/core/model/valueobjects/phone_number.dart';
import 'package:trickster/core/model/valueobjects/string_single_line.dart';
import 'package:trickster/core/model/valueobjects/unique_id.dart';
import 'package:trickster/domain/entity/user.dart';

void main() {
  group('failureOption', () {
    test('should be empty failureOption when user was constructed correctly',
        () {
      final tUser = User(
          id: UniqueId(),
          name: StringSingleLine("randomText"),
          emailAddress: EmailAddress("random@email.com"),
          emailVerified: true,
          isAnonymous: false,
          phoneNumber: PhoneNumber("+34 123456789"),
          photoUrl: "");
      expect(tUser.failureOption.isNone(), true);
    });

    test('should have some failureOption when user was constructed incorrectly',
        () {
      final tUser = User(
          id: UniqueId(),
          name: StringSingleLine("random\ntext"),
          emailAddress: EmailAddress("randomEmail"),
          emailVerified: true,
          isAnonymous: false,
          phoneNumber: PhoneNumber("123"),
          photoUrl: "");
      expect(tUser.failureOption.isSome(), true);
    });
  });
}
