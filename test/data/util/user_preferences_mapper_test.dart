import 'package:flutter_test/flutter_test.dart';
import 'package:trickster/data/model/user_preferences_dto.dart';
import 'package:trickster/data/util/user_preferences_mapper.dart';
import 'package:trickster/domain/entity/user_preferences.dart';

void main() {
  test('should return user preferences when userPreferencesDto not null',
      () async {
    final tUserPreferencesDto =
        UserPreferencesDto(isLogged: true, isDark: false);
    const tUserPreferences = UserPreferences(isLogged: true, isDark: false);
    final result = UserPreferencesMapper().fromDto(tUserPreferencesDto);
    expect(result, tUserPreferences);
  });

  test('should return null when userPreferencesDto is null', () {
    final result = UserPreferencesMapper().fromDto(null);
    expect(result, null);
  });
}
