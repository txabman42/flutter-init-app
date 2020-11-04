import 'package:freezed_annotation/freezed_annotation.dart';

part 'shared_preferences_exception.freezed.dart';

@freezed
abstract class SharedPreferencesException with _$SharedPreferencesException{
  const factory SharedPreferencesException.notFound() = NotFound;
  const factory SharedPreferencesException.invalidType() = InvalidType;
}