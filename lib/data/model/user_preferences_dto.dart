import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meta/meta.dart';
import 'package:trickster/domain/entity/user_preferences.dart';

part 'user_preferences_dto.freezed.dart';
part 'user_preferences_dto.g.dart';

@freezed
abstract class UserPreferencesDto with _$UserPreferencesDto {
  factory UserPreferencesDto({
    @required bool isLogged,
    @required bool isDark,
  }) = _UserPreferencesDto;

  factory UserPreferencesDto.fromJson(Map<String, dynamic> json) =>
      _$UserPreferencesDtoFromJson(json);

  factory UserPreferencesDto.fromEntity(UserPreferences userPreferences) {
    return UserPreferencesDto(
        isLogged: userPreferences.isLogged, isDark: userPreferences.isDark);
  }
}
