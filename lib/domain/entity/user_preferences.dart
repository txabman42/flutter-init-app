import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meta/meta.dart';

part 'user_preferences.freezed.dart';

@freezed
abstract class UserPreferences with _$UserPreferences {
  const factory UserPreferences({
    @required bool isLogged,
    @required bool isDark,
  }) = _UserPreferences;
}
