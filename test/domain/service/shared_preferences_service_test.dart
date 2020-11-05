import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:trickster/core/error/shared_preferences_exception.dart';
import 'package:trickster/domain/entity/user_preferences.dart';
import 'package:trickster/domain/repository/i_shared_preferences_repository.dart';
import 'package:trickster/domain/service/shared_preferences_service.dart';

class MockSharedPreferencesRepository extends Mock
    implements ISharedPreferencesRepository {}

void main() {
  MockSharedPreferencesRepository mockSharedPreferencesRepository;
  SharedPreferencesService sharedPreferencesService;

  setUp(() async {
    mockSharedPreferencesRepository = MockSharedPreferencesRepository();
    sharedPreferencesService =
        SharedPreferencesService(mockSharedPreferencesRepository);
  });

  const UserPreferences tUserPreferences =
      UserPreferences(isLogged: true, isDark: false);

  group('getUserPreferences', () {
    test(
        'should return directly the response from repository when correct response',
        () {
      when(mockSharedPreferencesRepository.getUserPreferences())
          .thenReturn(right(tUserPreferences));
      final result = sharedPreferencesService.getUserPreferences();
      expect(result, right(tUserPreferences));
      verify(mockSharedPreferencesRepository.getUserPreferences());
    });

    test('should return directly the response from repository when exception',
        () {
      when(mockSharedPreferencesRepository.getUserPreferences())
          .thenReturn(left(const SharedPreferencesException.notFound()));
      final result = sharedPreferencesService.getUserPreferences();
      expect(result, left(const SharedPreferencesException.notFound()));
      verify(mockSharedPreferencesRepository.getUserPreferences());
    });
  });

  group('setUserPreferences', () {
    test('should return directly the response from repository', () async {
      when(mockSharedPreferencesRepository.setUserPreferences(tUserPreferences))
          .thenAnswer((_) async => true);
      final result = await sharedPreferencesService.setUserPreferences(tUserPreferences);
      expect(result, true);
      verify(mockSharedPreferencesRepository.setUserPreferences(tUserPreferences));
    });
  });
}
