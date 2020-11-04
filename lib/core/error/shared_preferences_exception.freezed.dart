// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'shared_preferences_exception.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$SharedPreferencesExceptionTearOff {
  const _$SharedPreferencesExceptionTearOff();

// ignore: unused_element
  NotFound notFound() {
    return const NotFound();
  }

// ignore: unused_element
  InvalidType invalidType() {
    return const InvalidType();
  }
}

/// @nodoc
// ignore: unused_element
const $SharedPreferencesException = _$SharedPreferencesExceptionTearOff();

/// @nodoc
mixin _$SharedPreferencesException {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result notFound(),
    @required Result invalidType(),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result notFound(),
    Result invalidType(),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result notFound(NotFound value),
    @required Result invalidType(InvalidType value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result notFound(NotFound value),
    Result invalidType(InvalidType value),
    @required Result orElse(),
  });
}

/// @nodoc
abstract class $SharedPreferencesExceptionCopyWith<$Res> {
  factory $SharedPreferencesExceptionCopyWith(SharedPreferencesException value,
          $Res Function(SharedPreferencesException) then) =
      _$SharedPreferencesExceptionCopyWithImpl<$Res>;
}

/// @nodoc
class _$SharedPreferencesExceptionCopyWithImpl<$Res>
    implements $SharedPreferencesExceptionCopyWith<$Res> {
  _$SharedPreferencesExceptionCopyWithImpl(this._value, this._then);

  final SharedPreferencesException _value;
  // ignore: unused_field
  final $Res Function(SharedPreferencesException) _then;
}

/// @nodoc
abstract class $NotFoundCopyWith<$Res> {
  factory $NotFoundCopyWith(NotFound value, $Res Function(NotFound) then) =
      _$NotFoundCopyWithImpl<$Res>;
}

/// @nodoc
class _$NotFoundCopyWithImpl<$Res>
    extends _$SharedPreferencesExceptionCopyWithImpl<$Res>
    implements $NotFoundCopyWith<$Res> {
  _$NotFoundCopyWithImpl(NotFound _value, $Res Function(NotFound) _then)
      : super(_value, (v) => _then(v as NotFound));

  @override
  NotFound get _value => super._value as NotFound;
}

/// @nodoc
class _$NotFound implements NotFound {
  const _$NotFound();

  @override
  String toString() {
    return 'SharedPreferencesException.notFound()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is NotFound);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result notFound(),
    @required Result invalidType(),
  }) {
    assert(notFound != null);
    assert(invalidType != null);
    return notFound();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result notFound(),
    Result invalidType(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (notFound != null) {
      return notFound();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result notFound(NotFound value),
    @required Result invalidType(InvalidType value),
  }) {
    assert(notFound != null);
    assert(invalidType != null);
    return notFound(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result notFound(NotFound value),
    Result invalidType(InvalidType value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (notFound != null) {
      return notFound(this);
    }
    return orElse();
  }
}

abstract class NotFound implements SharedPreferencesException {
  const factory NotFound() = _$NotFound;
}

/// @nodoc
abstract class $InvalidTypeCopyWith<$Res> {
  factory $InvalidTypeCopyWith(
          InvalidType value, $Res Function(InvalidType) then) =
      _$InvalidTypeCopyWithImpl<$Res>;
}

/// @nodoc
class _$InvalidTypeCopyWithImpl<$Res>
    extends _$SharedPreferencesExceptionCopyWithImpl<$Res>
    implements $InvalidTypeCopyWith<$Res> {
  _$InvalidTypeCopyWithImpl(
      InvalidType _value, $Res Function(InvalidType) _then)
      : super(_value, (v) => _then(v as InvalidType));

  @override
  InvalidType get _value => super._value as InvalidType;
}

/// @nodoc
class _$InvalidType implements InvalidType {
  const _$InvalidType();

  @override
  String toString() {
    return 'SharedPreferencesException.invalidType()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is InvalidType);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result notFound(),
    @required Result invalidType(),
  }) {
    assert(notFound != null);
    assert(invalidType != null);
    return invalidType();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result notFound(),
    Result invalidType(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (invalidType != null) {
      return invalidType();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result notFound(NotFound value),
    @required Result invalidType(InvalidType value),
  }) {
    assert(notFound != null);
    assert(invalidType != null);
    return invalidType(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result notFound(NotFound value),
    Result invalidType(InvalidType value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (invalidType != null) {
      return invalidType(this);
    }
    return orElse();
  }
}

abstract class InvalidType implements SharedPreferencesException {
  const factory InvalidType() = _$InvalidType;
}
