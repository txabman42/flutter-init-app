// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'user_preferences_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
UserPreferencesDto _$UserPreferencesDtoFromJson(Map<String, dynamic> json) {
  return _UserPreferencesDto.fromJson(json);
}

/// @nodoc
class _$UserPreferencesDtoTearOff {
  const _$UserPreferencesDtoTearOff();

// ignore: unused_element
  _UserPreferencesDto call({@required bool isLogged, @required bool isDark}) {
    return _UserPreferencesDto(
      isLogged: isLogged,
      isDark: isDark,
    );
  }

// ignore: unused_element
  UserPreferencesDto fromJson(Map<String, Object> json) {
    return UserPreferencesDto.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $UserPreferencesDto = _$UserPreferencesDtoTearOff();

/// @nodoc
mixin _$UserPreferencesDto {
  bool get isLogged;
  bool get isDark;

  Map<String, dynamic> toJson();
  $UserPreferencesDtoCopyWith<UserPreferencesDto> get copyWith;
}

/// @nodoc
abstract class $UserPreferencesDtoCopyWith<$Res> {
  factory $UserPreferencesDtoCopyWith(
          UserPreferencesDto value, $Res Function(UserPreferencesDto) then) =
      _$UserPreferencesDtoCopyWithImpl<$Res>;
  $Res call({bool isLogged, bool isDark});
}

/// @nodoc
class _$UserPreferencesDtoCopyWithImpl<$Res>
    implements $UserPreferencesDtoCopyWith<$Res> {
  _$UserPreferencesDtoCopyWithImpl(this._value, this._then);

  final UserPreferencesDto _value;
  // ignore: unused_field
  final $Res Function(UserPreferencesDto) _then;

  @override
  $Res call({
    Object isLogged = freezed,
    Object isDark = freezed,
  }) {
    return _then(_value.copyWith(
      isLogged: isLogged == freezed ? _value.isLogged : isLogged as bool,
      isDark: isDark == freezed ? _value.isDark : isDark as bool,
    ));
  }
}

/// @nodoc
abstract class _$UserPreferencesDtoCopyWith<$Res>
    implements $UserPreferencesDtoCopyWith<$Res> {
  factory _$UserPreferencesDtoCopyWith(
          _UserPreferencesDto value, $Res Function(_UserPreferencesDto) then) =
      __$UserPreferencesDtoCopyWithImpl<$Res>;
  @override
  $Res call({bool isLogged, bool isDark});
}

/// @nodoc
class __$UserPreferencesDtoCopyWithImpl<$Res>
    extends _$UserPreferencesDtoCopyWithImpl<$Res>
    implements _$UserPreferencesDtoCopyWith<$Res> {
  __$UserPreferencesDtoCopyWithImpl(
      _UserPreferencesDto _value, $Res Function(_UserPreferencesDto) _then)
      : super(_value, (v) => _then(v as _UserPreferencesDto));

  @override
  _UserPreferencesDto get _value => super._value as _UserPreferencesDto;

  @override
  $Res call({
    Object isLogged = freezed,
    Object isDark = freezed,
  }) {
    return _then(_UserPreferencesDto(
      isLogged: isLogged == freezed ? _value.isLogged : isLogged as bool,
      isDark: isDark == freezed ? _value.isDark : isDark as bool,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_UserPreferencesDto implements _UserPreferencesDto {
  _$_UserPreferencesDto({@required this.isLogged, @required this.isDark})
      : assert(isLogged != null),
        assert(isDark != null);

  factory _$_UserPreferencesDto.fromJson(Map<String, dynamic> json) =>
      _$_$_UserPreferencesDtoFromJson(json);

  @override
  final bool isLogged;
  @override
  final bool isDark;

  @override
  String toString() {
    return 'UserPreferencesDto(isLogged: $isLogged, isDark: $isDark)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UserPreferencesDto &&
            (identical(other.isLogged, isLogged) ||
                const DeepCollectionEquality()
                    .equals(other.isLogged, isLogged)) &&
            (identical(other.isDark, isDark) ||
                const DeepCollectionEquality().equals(other.isDark, isDark)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(isLogged) ^
      const DeepCollectionEquality().hash(isDark);

  @override
  _$UserPreferencesDtoCopyWith<_UserPreferencesDto> get copyWith =>
      __$UserPreferencesDtoCopyWithImpl<_UserPreferencesDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_UserPreferencesDtoToJson(this);
  }
}

abstract class _UserPreferencesDto implements UserPreferencesDto {
  factory _UserPreferencesDto(
      {@required bool isLogged, @required bool isDark}) = _$_UserPreferencesDto;

  factory _UserPreferencesDto.fromJson(Map<String, dynamic> json) =
      _$_UserPreferencesDto.fromJson;

  @override
  bool get isLogged;
  @override
  bool get isDark;
  @override
  _$UserPreferencesDtoCopyWith<_UserPreferencesDto> get copyWith;
}
