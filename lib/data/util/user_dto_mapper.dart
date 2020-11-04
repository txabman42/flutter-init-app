import 'package:injectable/injectable.dart';
import 'package:trickster/core/model/valueobjects/email_address.dart';
import 'package:trickster/core/model/valueobjects/phone_number.dart';
import 'package:trickster/core/model/valueobjects/string_single_line.dart';
import 'package:trickster/core/model/valueobjects/unique_id.dart';
import 'package:trickster/data/model/user_dto.dart';
import 'package:trickster/domain/entity/user.dart';

@lazySingleton
class UserMapper {
  User fromDto(UserDto _) {
    return _ == null
        ? null
        : User(
        id: UniqueId.fromUniqueString(_.id),
        name: StringSingleLine(_.name),
        emailAddress: EmailAddress(_.emailAddress),
        emailVerified: _.emailVerified,
        isAnonymous: _.isAnonymous,
        phoneNumber: PhoneNumber(_.phoneNumber),
        photoUrl: _.photoUrl);
  }
}