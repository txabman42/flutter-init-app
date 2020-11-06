import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:trickster/core/error/shared_preferences_exception.dart';
import 'package:trickster/data/datasource/shared_preferences_datasource.dart';
import 'package:trickster/data/repository/shared_preferences_repository.dart';
import 'package:trickster/domain/constant/preferences.dart';
import 'package:trickster/domain/entity/user_preferences.dart';

class MockSharedPreferencesDatasource extends Mock
    implements ISharedPreferencesDatasource {}

void main() {
  MockSharedPreferencesDatasource mockSharedPreferencesDatasource;
  SharedPreferencesRepository sharedPreferencesRepository;

  const String userKey = Preferences.USER_PREFERENCES;
  const String userPrefsJsonStr = '{"isLogged":true,"isDark":false}';
  const UserPreferences tUserPreferences =
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
      when(mockSharedPreferencesDatasource.getString(key: userKey))
          .thenReturn(right(userPrefsJsonStr));
      final result = sharedPreferencesRepository.getUserPreferences();
      expect(result, right(tUserPreferences));
      verify(mockSharedPreferencesDatasource.getString(key: userKey));
    });

    test('should return sharedPreferencesException when datasource throws exception', () {
      when(mockSharedPreferencesDatasource.getString(key: userKey))
          .thenReturn(left(const SharedPreferencesException.notFound()));
      final result = sharedPreferencesRepository.getUserPreferences();
      expect(result, left(const SharedPreferencesException.notFound()));
      verify(mockSharedPreferencesDatasource.getString(key: userKey));
    });
  });

  group('setUserPreferences', () {
    test('should set userPreferences when they are valid', () async {
      when(mockSharedPreferencesDatasource.setString(key: userKey, value: userPrefsJsonStr))
      .thenAnswer((_) async => true);
      final result = await sharedPreferencesRepository.setUserPreferences(tUserPreferences);
      expect(result, isTrue);
      verify(mockSharedPreferencesDatasource.setString(key: userKey, value: userPrefsJsonStr));
    });
  });
}
