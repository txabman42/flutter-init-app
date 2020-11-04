import 'package:flutter_test/flutter_test.dart';
import 'package:trickster/core/model/valueobjects/email_address.dart';
import 'package:trickster/core/model/valueobjects/phone_number.dart';
import 'package:trickster/core/model/valueobjects/string_single_line.dart';
import 'package:trickster/core/model/valueobjects/unique_id.dart';
import 'package:trickster/data/model/user_dto.dart';
import 'package:trickster/data/util/user_dto_mapper.dart';
import 'package:trickster/domain/entity/user.dart';

void main() {
  test('should return user entity when userDto not null', () {
    final tUserDto = UserDto(
        id: "123",
        name: "random name",
        emailAddress: "random@email.com",
        emailVerified: true,
        isAnonymous: false,
        phoneNumber: "123456789",
        photoUrl: "random_url");
    final tUser = User(
        id: UniqueId.fromUniqueString("123"),
        name: StringSingleLine("random name"),
        emailAddress: EmailAddress("random@email.com"),
        emailVerified: true,
        isAnonymous: false,
        phoneNumber: PhoneNumber("123456789"),
        photoUrl: "random_url");
    final result = UserMapper().fromDto(tUserDto);
    expect(result, tUser);
  });

  test('should return null when userDto is null', () {
    final result = UserMapper().fromDto(null);
    expect(result, null);
  });
}
