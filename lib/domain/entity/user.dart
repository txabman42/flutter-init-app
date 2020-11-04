import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:trickster/core/error/exceptions.dart';
import 'package:trickster/core/model/valueobjects/email_address.dart';
import 'package:trickster/core/model/valueobjects/phone_number.dart';
import 'package:trickster/core/model/valueobjects/string_single_line.dart';
import 'package:trickster/core/model/valueobjects/unique_id.dart';
import 'package:trickster/domain/entity/i_entity.dart';

part 'user.freezed.dart';

@freezed
abstract class User with _$User implements IEntity {
  const factory User({
    @required UniqueId id,
    @required StringSingleLine name,
    @required EmailAddress emailAddress,
    @required bool emailVerified,
    @required bool isAnonymous,
    @required PhoneNumber phoneNumber,
    @required String photoUrl,
  }) = _User;
}

extension UserX on User {
  Option<ValueException<dynamic>> get failureOption {
    return name.failureOrUnit
        .andThen(emailAddress.failureOrUnit)
        .andThen(phoneNumber.failureOrUnit)
        .fold((l) => some(l), (r) => none());
  }
}
