import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trickster/core/error/shared_preferences_exception.dart';
import 'package:trickster/data/datasource/shared_preferences_datasource.dart';

class MockSharedPreferences extends Mock implements SharedPreferences {}

void main () {
  ISharedPreferencesDatasource sharedPreferencesDatasource;
  MockSharedPreferences mockSharedPreferences;

  String key;

  setUp(() async {
    mockSharedPreferences = MockSharedPreferences();
    sharedPreferencesDatasource = SharedPreferencesDatasource(mockSharedPreferences);

    key = "random_key";
  });

  group('containsKey', () {
    test('should return sharedPreferences returned value', () {
      const expectedResult = true;
      when(mockSharedPreferences.containsKey(key)).thenReturn(expectedResult);
      final result = sharedPreferencesDatasource.containsKey(key: key);
      expect(result, expectedResult);
      verify(mockSharedPreferences.containsKey(key));
    });
  });

  group('getKeys', () {
    test('should return sharedPreferences returned value', () {
      final Set<String> expectedResult = {};
      when(mockSharedPreferences.getKeys()).thenReturn(expectedResult);
      final result = sharedPreferencesDatasource.getKeys();
      expect(result, expectedResult);
      verify(mockSharedPreferences.getKeys());
    });
  });
  
  group('getBool', () {
    test('should return sharedPreferences value when key exists', () async {
      const bool expectedResult = true;
      when(mockSharedPreferences.getBool(key)).thenReturn(expectedResult);
      final result = sharedPreferencesDatasource.getBool(key: key);
      expect(result, right(expectedResult));
      verify(mockSharedPreferences.getBool(key));
    });

    test('should return notFound exception when value is null', () async {
      when(mockSharedPreferences.getBool(key)).thenReturn(null);
      final result = sharedPreferencesDatasource.getBool(key: key);
      expect(result, left(const SharedPreferencesException.notFound()));
      verify(mockSharedPreferences.getBool(key));
    });

    test('should return invalidType exception when returned value is not of expected type', () async {
      when(mockSharedPreferences.getBool(key)).thenThrow(Exception());
      final result = sharedPreferencesDatasource.getBool(key: key);
      expect(result, left(const SharedPreferencesException.invalidType()));
      verify(mockSharedPreferences.getBool(key));
    });
  });

  group('getDouble', () {
    test('should return sharedPreferences value when key exists', () async {
      const double expectedResult = 1.0;
      when(mockSharedPreferences.getDouble(key)).thenReturn(expectedResult);
      final result = sharedPreferencesDatasource.getDouble(key: key);
      expect(result, right(expectedResult));
      verify(mockSharedPreferences.getDouble(key));
    });

    test('should return notFound exception when value is null', () async {
      when(mockSharedPreferences.getDouble(key)).thenReturn(null);
      final result = sharedPreferencesDatasource.getDouble(key: key);
      expect(result, left(const SharedPreferencesException.notFound()));
      verify(mockSharedPreferences.getDouble(key));
    });

    test('should return invalidType exception when returned value is not of expected type', () async {
      when(mockSharedPreferences.getDouble(key)).thenThrow(Exception());
      final result = sharedPreferencesDatasource.getDouble(key: key);
      expect(result, left(const SharedPreferencesException.invalidType()));
      verify(mockSharedPreferences.getDouble(key));
    });
  });

  group('getInt', () {
    test('should return sharedPreferences value when key exists', () async {
      const int expectedResult = 1;
      when(mockSharedPreferences.getInt(key)).thenReturn(expectedResult);
      final result = sharedPreferencesDatasource.getInt(key: key);
      expect(result, right(expectedResult));
      verify(mockSharedPreferences.getInt(key));
    });

    test('should return notFound exception when value is null', () async {
      when(mockSharedPreferences.getInt(key)).thenReturn(null);
      final result = sharedPreferencesDatasource.getInt(key: key);
      expect(result, left(const SharedPreferencesException.notFound()));
      verify(mockSharedPreferences.getInt(key));
    });

    test('should return invalidType exception when returned value is not of expected type', () async {
      when(mockSharedPreferences.getInt(key)).thenThrow(Exception());
      final result = sharedPreferencesDatasource.getInt(key: key);
      expect(result, left(const SharedPreferencesException.invalidType()));
      verify(mockSharedPreferences.getInt(key));
    });
  });

  group('getString', () {
    test('should return sharedPreferences value when key exists', () async {
      const String expectedResult = "random string";
      when(mockSharedPreferences.getString(key)).thenReturn(expectedResult);
      final result = sharedPreferencesDatasource.getString(key: key);
      expect(result, right(expectedResult));
      verify(mockSharedPreferences.getString(key));
    });

    test('should return notFound exception when value is null', () async {
      when(mockSharedPreferences.getString(key)).thenReturn(null);
      final result = sharedPreferencesDatasource.getString(key: key);
      expect(result, left(const SharedPreferencesException.notFound()));
      verify(mockSharedPreferences.getString(key));
    });

    test('should return invalidType exception when returned value is not of expected type', () async {
      when(mockSharedPreferences.getString(key)).thenThrow(Exception());
      final result = sharedPreferencesDatasource.getString(key: key);
      expect(result, left(const SharedPreferencesException.invalidType()));
      verify(mockSharedPreferences.getString(key));
    });
  });

  group('getListString', () {
    test('should return sharedPreferences value when key exists', () async {
      final List<String> expectedResult = List(0);
      when(mockSharedPreferences.getStringList(key)).thenReturn(expectedResult);
      final result = sharedPreferencesDatasource.getListString(key: key);
      expect(result, right(expectedResult));
      verify(mockSharedPreferences.getStringList(key));
    });

    test('should return notFound exception when value is null', () async {
      when(mockSharedPreferences.getStringList(key)).thenReturn(null);
      final result = sharedPreferencesDatasource.getListString(key: key);
      expect(result, left(const SharedPreferencesException.notFound()));
      verify(mockSharedPreferences.getStringList(key));
    });

    test('should return invalidType exception when returned value is not of expected type', () async {
      when(mockSharedPreferences.getStringList(key)).thenThrow(Exception());
      final result = sharedPreferencesDatasource.getListString(key: key);
      expect(result, left(const SharedPreferencesException.invalidType()));
      verify(mockSharedPreferences.getStringList(key));
    });
  });

  group('remove', () {
    test('should return sharedPreferences returned value', () async {
      const expectedResult = true;
      when(mockSharedPreferences.remove(key))
      .thenAnswer((_) async => expectedResult);
      final result = await sharedPreferencesDatasource.remove(key: key);
      expect(result, expectedResult);
      verify(mockSharedPreferences.remove(key));
    });
  });

  group('set', () {
    test('should return sharedPreferences returned value when set bool', () async {
      const expectedResult = true;
      const value = false;
      when(mockSharedPreferences.setBool(key, value))
          .thenAnswer((_) async => expectedResult);
      final result = await sharedPreferencesDatasource.setBool(key: key, value: value);
      expect(result, expectedResult);
      verify(mockSharedPreferences.setBool(key, value));
    });

    test('should return sharedPreferences returned value when set double', () async {
      const expectedResult = true;
      const value = 1.0;
      when(mockSharedPreferences.setDouble(key, value))
          .thenAnswer((_) async => expectedResult);
      final result = await sharedPreferencesDatasource.setDouble(key: key, value: value);
      expect(result, expectedResult);
      verify(mockSharedPreferences.setDouble(key, value));
    });

    test('should return sharedPreferences returned value when set int', () async {
      const expectedResult = true;
      const value = 1;
      when(mockSharedPreferences.setInt(key, value))
          .thenAnswer((_) async => expectedResult);
      final result = await sharedPreferencesDatasource.setInt(key: key, value: value);
      expect(result, expectedResult);
      verify(mockSharedPreferences.setInt(key, value));
    });

    test('should return sharedPreferences returned value when set String', () async {
      const expectedResult = true;
      const value = "random string";
      when(mockSharedPreferences.setString(key, value))
          .thenAnswer((_) async => expectedResult);
      final result = await sharedPreferencesDatasource.setString(key: key, value: value);
      expect(result, expectedResult);
      verify(mockSharedPreferences.setString(key, value));
    });

    test('should return sharedPreferences returned value when set List<String>', () async {
      const expectedResult = true;
      final List<String> value = List(0);
      when(mockSharedPreferences.setStringList(key, value))
          .thenAnswer((_) async => expectedResult);
      final result = await sharedPreferencesDatasource.setListString(key: key, value: value);
      expect(result, expectedResult);
      verify(mockSharedPreferences.setStringList(key, value));
    });
  });
}