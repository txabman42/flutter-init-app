// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'user_preferences.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$UserPreferencesTearOff {
  const _$UserPreferencesTearOff();

// ignore: unused_element
  _UserPreferences call({@required bool isLogged, @required bool isDark}) {
    return _UserPreferences(
      isLogged: isLogged,
      isDark: isDark,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $UserPreferences = _$UserPreferencesTearOff();

/// @nodoc
mixin _$UserPreferences {
  bool get isLogged;
  bool get isDark;

  $UserPreferencesCopyWith<UserPreferences> get copyWith;
}

/// @nodoc
abstract class $UserPreferencesCopyWith<$Res> {
  factory $UserPreferencesCopyWith(
          UserPreferences value, $Res Function(UserPreferences) then) =
      _$UserPreferencesCopyWithImpl<$Res>;
  $Res call({bool isLogged, bool isDark});
}

/// @nodoc
class _$UserPreferencesCopyWithImpl<$Res>
    implements $UserPreferencesCopyWith<$Res> {
  _$UserPreferencesCopyWithImpl(this._value, this._then);

  final UserPreferences _value;
  // ignore: unused_field
  final $Res Function(UserPreferences) _then;

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
abstract class _$UserPreferencesCopyWith<$Res>
    implements $UserPreferencesCopyWith<$Res> {
  factory _$UserPreferencesCopyWith(
          _UserPreferences value, $Res Function(_UserPreferences) then) =
      __$UserPreferencesCopyWithImpl<$Res>;
  @override
  $Res call({bool isLogged, bool isDark});
}

/// @nodoc
class __$UserPreferencesCopyWithImpl<$Res>
    extends _$UserPreferencesCopyWithImpl<$Res>
    implements _$UserPreferencesCopyWith<$Res> {
  __$UserPreferencesCopyWithImpl(
      _UserPreferences _value, $Res Function(_UserPreferences) _then)
      : super(_value, (v) => _then(v as _UserPreferences));

  @override
  _UserPreferences get _value => super._value as _UserPreferences;

  @override
  $Res call({
    Object isLogged = freezed,
    Object isDark = freezed,
  }) {
    return _then(_UserPreferences(
      isLogged: isLogged == freezed ? _value.isLogged : isLogged as bool,
      isDark: isDark == freezed ? _value.isDark : isDark as bool,
    ));
  }
}

/// @nodoc
class _$_UserPreferences implements _UserPreferences {
  const _$_UserPreferences({@required this.isLogged, @required this.isDark})
      : assert(isLogged != null),
        assert(isDark != null);

  @override
  final bool isLogged;
  @override
  final bool isDark;

  @override
  String toString() {
    return 'UserPreferences(isLogged: $isLogged, isDark: $isDark)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UserPreferences &&
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
  _$UserPreferencesCopyWith<_UserPreferences> get copyWith =>
      __$UserPreferencesCopyWithImpl<_UserPreferences>(this, _$identity);
}

abstract class _UserPreferences implements UserPreferences {
  const factory _UserPreferences(
      {@required bool isLogged, @required bool isDark}) = _$_UserPreferences;

  @override
  bool get isLogged;
  @override
  bool get isDark;
  @override
  _$UserPreferencesCopyWith<_UserPreferences> get copyWith;
}
