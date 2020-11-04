// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$UserTearOff {
  const _$UserTearOff();

// ignore: unused_element
  _User call(
      {@required UniqueId id,
      @required StringSingleLine name,
      @required EmailAddress emailAddress,
      @required bool emailVerified,
      @required bool isAnonymous,
      @required PhoneNumber phoneNumber,
      @required String photoUrl}) {
    return _User(
      id: id,
      name: name,
      emailAddress: emailAddress,
      emailVerified: emailVerified,
      isAnonymous: isAnonymous,
      phoneNumber: phoneNumber,
      photoUrl: photoUrl,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $User = _$UserTearOff();

/// @nodoc
mixin _$User {
  UniqueId get id;
  StringSingleLine get name;
  EmailAddress get emailAddress;
  bool get emailVerified;
  bool get isAnonymous;
  PhoneNumber get phoneNumber;
  String get photoUrl;

  $UserCopyWith<User> get copyWith;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res>;
  $Res call(
      {UniqueId id,
      StringSingleLine name,
      EmailAddress emailAddress,
      bool emailVerified,
      bool isAnonymous,
      PhoneNumber phoneNumber,
      String photoUrl});
}

/// @nodoc
class _$UserCopyWithImpl<$Res> implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  final User _value;
  // ignore: unused_field
  final $Res Function(User) _then;

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
      id: id == freezed ? _value.id : id as UniqueId,
      name: name == freezed ? _value.name : name as StringSingleLine,
      emailAddress: emailAddress == freezed
          ? _value.emailAddress
          : emailAddress as EmailAddress,
      emailVerified: emailVerified == freezed
          ? _value.emailVerified
          : emailVerified as bool,
      isAnonymous:
          isAnonymous == freezed ? _value.isAnonymous : isAnonymous as bool,
      phoneNumber: phoneNumber == freezed
          ? _value.phoneNumber
          : phoneNumber as PhoneNumber,
      photoUrl: photoUrl == freezed ? _value.photoUrl : photoUrl as String,
    ));
  }
}

/// @nodoc
abstract class _$UserCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$UserCopyWith(_User value, $Res Function(_User) then) =
      __$UserCopyWithImpl<$Res>;
  @override
  $Res call(
      {UniqueId id,
      StringSingleLine name,
      EmailAddress emailAddress,
      bool emailVerified,
      bool isAnonymous,
      PhoneNumber phoneNumber,
      String photoUrl});
}

/// @nodoc
class __$UserCopyWithImpl<$Res> extends _$UserCopyWithImpl<$Res>
    implements _$UserCopyWith<$Res> {
  __$UserCopyWithImpl(_User _value, $Res Function(_User) _then)
      : super(_value, (v) => _then(v as _User));

  @override
  _User get _value => super._value as _User;

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
    return _then(_User(
      id: id == freezed ? _value.id : id as UniqueId,
      name: name == freezed ? _value.name : name as StringSingleLine,
      emailAddress: emailAddress == freezed
          ? _value.emailAddress
          : emailAddress as EmailAddress,
      emailVerified: emailVerified == freezed
          ? _value.emailVerified
          : emailVerified as bool,
      isAnonymous:
          isAnonymous == freezed ? _value.isAnonymous : isAnonymous as bool,
      phoneNumber: phoneNumber == freezed
          ? _value.phoneNumber
          : phoneNumber as PhoneNumber,
      photoUrl: photoUrl == freezed ? _value.photoUrl : photoUrl as String,
    ));
  }
}

/// @nodoc
class _$_User implements _User {
  const _$_User(
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

  @override
  final UniqueId id;
  @override
  final StringSingleLine name;
  @override
  final EmailAddress emailAddress;
  @override
  final bool emailVerified;
  @override
  final bool isAnonymous;
  @override
  final PhoneNumber phoneNumber;
  @override
  final String photoUrl;

  @override
  String toString() {
    return 'User(id: $id, name: $name, emailAddress: $emailAddress, emailVerified: $emailVerified, isAnonymous: $isAnonymous, phoneNumber: $phoneNumber, photoUrl: $photoUrl)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _User &&
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
  _$UserCopyWith<_User> get copyWith =>
      __$UserCopyWithImpl<_User>(this, _$identity);
}

abstract class _User implements User {
  const factory _User(
      {@required UniqueId id,
      @required StringSingleLine name,
      @required EmailAddress emailAddress,
      @required bool emailVerified,
      @required bool isAnonymous,
      @required PhoneNumber phoneNumber,
      @required String photoUrl}) = _$_User;

  @override
  UniqueId get id;
  @override
  StringSingleLine get name;
  @override
  EmailAddress get emailAddress;
  @override
  bool get emailVerified;
  @override
  bool get isAnonymous;
  @override
  PhoneNumber get phoneNumber;
  @override
  String get photoUrl;
  @override
  _$UserCopyWith<_User> get copyWith;
}
