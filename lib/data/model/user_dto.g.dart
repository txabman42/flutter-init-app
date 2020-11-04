// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserDto _$_$_UserDtoFromJson(Map<String, dynamic> json) {
  return _$_UserDto(
    id: json['id'] as String,
    name: json['name'] as String,
    emailAddress: json['emailAddress'] as String,
    emailVerified: json['emailVerified'] as bool,
    isAnonymous: json['isAnonymous'] as bool,
    phoneNumber: json['phoneNumber'] as String,
    photoUrl: json['photoUrl'] as String,
  );
}

Map<String, dynamic> _$_$_UserDtoToJson(_$_UserDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'emailAddress': instance.emailAddress,
      'emailVerified': instance.emailVerified,
      'isAnonymous': instance.isAnonymous,
      'phoneNumber': instance.phoneNumber,
      'photoUrl': instance.photoUrl,
    };
