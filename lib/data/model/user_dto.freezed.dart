// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'user_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
UserDto _$UserDtoFromJson(Map<String, dynamic> json) {
  return _UserDto.fromJson(json);
}

/// @nodoc
class _$UserDtoTearOff {
  const _$UserDtoTearOff();

// ignore: unused_element
  _UserDto call(
      {@required String id,
      @required String name,
      @required String emailAddress,
      @required bool emailVerified,
      @required bool isAnonymous,
      @required String phoneNumber,
      @required String photoUrl}) {
    return _UserDto(
      id: id,
      name: name,
      emailAddress: emailAddress,
      emailVerified: emailVerified,
      isAnonymous: isAnonymous,
      phoneNumber: phoneNumber,
      photoUrl: photoUrl,
    );
  }

// ignore: unused_element
  UserDto fromJson(Map<String, Object> json) {
    return UserDto.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $UserDto = _$UserDtoTearOff();

/// @nodoc
mixin _$UserDto {
  String get id;
  String get name;
  String get emailAddress;
  bool get emailVerified;
  bool get isAnonymous;
  String get phoneNumber;
  String get photoUrl;

  Map<String, dynamic> toJson();
  $UserDtoCopyWith<UserDto> get copyWith;
}

/// @nodoc
abstract class $UserDtoCopyWith<$Res> {
  factory $UserDtoCopyWith(UserDto value, $Res Function(UserDto) then) =
      _$UserDtoCopyWithImpl<$Res>;
  $Res call(
      {String id,
      String name,
      String emailAddress,
      bool emailVerified,
      bool isAnonymous,
      String phoneNumber,
      String photoUrl});
}

/// @nodoc
class _$UserDtoCopyWithImpl<$Res> implements $UserDtoCopyWith<$Res> {
  _$UserDtoCopyWithImpl(this._value, this._then);

  final UserDto _value;
  // ignore: unused_field
  final $Res Function(UserDto) _then;

  @override
  $Res call({
    Object id = freezed,
    Object name = freezed,
    Object emailAddress = freezed,
    Object emailVerified = freezed,
    Object isAnonymous = freezed,
    Object phoneNumber = freezed,
    Object photoUrl = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as String,
      name: name == freezed ? _value.name : name as String,
      emailAddress: emailAddress == freezed
          ? _value.emailAddress
          : emailAddress as String,
      emailVerified: emailVerified == freezed
          ? _value.emailVerified
          : emailVerified as bool,
      isAnonymous:
          isAnonymous == freezed ? _value.isAnonymous : isAnonymous as bool,
      phoneNumber:
          phoneNumber == freezed ? _value.phoneNumber : phoneNumber as String,
      photoUrl: photoUrl == freezed ? _value.photoUrl : photoUrl as String,
    ));
  }
}

/// @nodoc
abstract class _$UserDtoCopyWith<$Res> implements $UserDtoCopyWith<$Res> {
  factory _$UserDtoCopyWith(_UserDto value, $Res Function(_UserDto) then) =
      __$UserDtoCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      String name,
      String emailAddress,
      bool emailVerified,
      bool isAnonymous,
      String phoneNumber,
      String photoUrl});
}

/// @nodoc
class __$UserDtoCopyWithImpl<$Res> extends _$UserDtoCopyWithImpl<$Res>
    implements _$UserDtoCopyWith<$Res> {
  __$UserDtoCopyWithImpl(_UserDto _value, $Res Function(_UserDto) _then)
      : super(_value, (v) => _then(v as _UserDto));

  @override
  _UserDto get _value => super._value as _UserDto;

  @override
  $Res call({
    Object id = freezed,
    Object name = freezed,
    Object emailAddress = freezed,
    Object emailVerified = freezed,
    Object isAnonymous = freezed,
    Object phoneNumber = freezed,
    Object photoUrl = freezed,
  }) {
    return _then(_UserDto(
      id: id == freezed ? _value.id : id as String,
      name: name == freezed ? _value.name : name as String,
      emailAddress: emailAddress == freezed
          ? _value.emailAddress
          : emailAddress as String,
      emailVerified: emailVerified == freezed
          ? _value.emailVerified
          : emailVerified as bool,
      isAnonymous:
          isAnonymous == freezed ? _value.isAnonymous : isAnonymous as bool,
      phoneNumber:
          phoneNumber == freezed ? _value.phoneNumber : phoneNumber as String,
      photoUrl: photoUrl == freezed ? _value.photoUrl : photoUrl as String,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_UserDto implements _UserDto {
  _$_UserDto(
      {@required this.id,
      @required this.name,
      @required this.emailAddress,
      @required this.emailVerified,
      @required this.isAnonymous,
      @required this.phoneNumber,
      @required this.photoUrl})
      : assert(id != null),
        assert(name != null),
        assert(emailAddress != null),
        assert(emailVerified != null),
        assert(isAnonymous != null),
        assert(phoneNumber != null),
        assert(photoUrl != null);

  factory _$_UserDto.fromJson(Map<String, dynamic> json) =>
      _$_$_UserDtoFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String emailAddress;
  @override
  final bool emailVerified;
  @override
  final bool isAnonymous;
  @override
  final String phoneNumber;
  @override
  final String photoUrl;

  @override
  String toString() {
    return 'UserDto(id: $id, name: $name, emailAddress: $emailAddress, emailVerified: $emailVerified, isAnonymous: $isAnonymous, phoneNumber: $phoneNumber, photoUrl: $photoUrl)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UserDto &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.emailAddress, emailAddress) ||
                const DeepCollectionEquality()
                    .equals(other.emailAddress, emailAddress)) &&
            (identical(other.emailVerified, emailVerified) ||
                const DeepCollectionEquality()
                    .equals(other.emailVerified, emailVerified)) &&
            (identical(other.isAnonymous, isAnonymous) ||
                const DeepCollectionEquality()
                    .equals(other.isAnonymous, isAnonymous)) &&
            (identical(other.phoneNumber, phoneNumber) ||
                const DeepCollectionEquality()
                    .equals(other.phoneNumber, phoneNumber)) &&
            (identical(other.photoUrl, photoUrl) ||
                const DeepCollectionEquality()
                    .equals(other.photoUrl, photoUrl)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(emailAddress) ^
      const DeepCollectionEquality().hash(emailVerified) ^
      const DeepCollectionEquality().hash(isAnonymous) ^
      const DeepCollectionEquality().hash(phoneNumber) ^
      const DeepCollectionEquality().hash(photoUrl);

  @override
  _$UserDtoCopyWith<_UserDto> get copyWith =>
      __$UserDtoCopyWithImpl<_UserDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_UserDtoToJson(this);
  }
}

abstract class _UserDto implements UserDto {
  factory _UserDto(
      {@required String id,
      @required String name,
      @required String emailAddress,
      @required bool emailVerified,
      @required bool isAnonymous,
      @required String phoneNumber,
      @required String photoUrl}) = _$_UserDto;

  factory _UserDto.fromJson(Map<String, dynamic> json) = _$_UserDto.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get emailAddress;
  @override
  bool get emailVerified;
  @override
  bool get isAnonymous;
  @override
  String get phoneNumber;
  @override
  String get photoUrl;
  @override
  _$UserDtoCopyWith<_UserDto> get copyWith;
}
