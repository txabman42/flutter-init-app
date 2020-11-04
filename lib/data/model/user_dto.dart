import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:trickster/domain/entity/user.dart';

part 'user_dto.freezed.dart';
part 'user_dto.g.dart';

@freezed
abstract class UserDto with _$UserDto {
  factory UserDto({
    @required String id,
    @required String name,
    @required String emailAddress,
    @required bool emailVerified,
    @required bool isAnonymous,
    @required String phoneNumber,
    @required String photoUrl,
  }) = _UserDto;

  factory UserDto.fromEntity(User user) {
    return UserDto(
        id: user.id.getOrCrash(),
        name: user.name.getOrCrash(),
        emailAddress: user.emailAddress.getOrCrash(),
        emailVerified: user.emailVerified,
        isAnonymous: user.isAnonymous,
        phoneNumber: user.phoneNumber.getOrCrash(),
        photoUrl: user.photoUrl);
  }

  factory UserDto.fromJson(Map<String, dynamic> json) =>
      _$UserDtoFromJson(json);
}
