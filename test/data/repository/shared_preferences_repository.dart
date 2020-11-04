import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:trickster/core/error/shared_preferences_exception.dart';
import 'package:trickster/data/datasource/shared_preferences_datasource.dart';
import 'package:trickster/data/repository/shared_preferences_repository.dart';
import 'package:trickster/domain/constants/preferences.dart';
import 'package:trickster/domain/entity/user_preferences.dart';

class MockSharedPreferencesDatasource extends Mock
    implements SharedPreferencesDatasource {}

void main() {
  MockSharedPreferencesDatasource mockSharedPreferencesDatasource;
  SharedPreferencesRepository sharedPreferencesRepository;

  const String key = Preferences.USER_PREFERENCES;
  const String userPrefsJsonStr = '{"isLogged": true, "isDark": false}';
  const UserPreferences userPreferences =
      UserPreferences(isLogged: true, isDark: false);

  setUp(() async {
    mockSharedPreferencesDatasource = MockSharedPreferencesDatasource();
    sharedPreferencesRepository =
        SharedPreferencesRepository(mockSharedPreferencesDatasource);
  });

  group('getUserPreferences', () {
    test(
        'should return userPreference entity when key exists in sharedPreferences',
        () {
      when(mockSharedPreferencesDatasource.getString(key: key))
          .thenReturn(right(userPrefsJsonStr));
      final result = sharedPreferencesRepository.getUserPreferences();
      expect(result, right(userPreferences));
      verify(mockSharedPreferencesDatasource.getString(key: key));
    });

    test('should return sharedPreferencesException when datasource throws exception', () {
      when(mockSharedPreferencesDatasource.getString(key: key))
          .thenReturn(left(const SharedPreferencesException.notFound()));
      final result = sharedPreferencesRepository.getUserPreferences();
      expect(result, left(const SharedPreferencesException.notFound()));
      verify(mockSharedPreferencesDatasource.getString(key: key));
    });
  });

  group('setUserPreferences', () {});
}
