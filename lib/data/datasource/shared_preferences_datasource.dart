import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trickster/core/error/shared_preferences_exception.dart';

abstract class ISharedPreferencesDatasource {
  Set<String> getKeys();

  Either<SharedPreferencesException, bool> getBool({@required String key});

  Either<SharedPreferencesException, int> getInt({@required String key});

  Either<SharedPreferencesException, double> getDouble({@required String key});

  Either<SharedPreferencesException, String> getString({@required String key});

  Either<SharedPreferencesException, List<String>> getListString({@required String key});

  Future<bool> setBool({@required String key, @required bool value});

  Future<bool> setInt({@required String key, @required int value});

  Future<bool> setDouble({@required String key, @required double value});

  Future<bool> setString({@required String key, @required String value});

  Future<bool> setListString({@required String key, @required List<String> value});

  Future<bool> remove({@required String key});

  bool containsKey({@required String key});
}

@prod
@lazySingleton
@RegisterAs(ISharedPreferencesDatasource)
class SharedPreferencesDatasource implements ISharedPreferencesDatasource {
  final SharedPreferences _sharedPreferences;

  SharedPreferencesDatasource(
    this._sharedPreferences,
  );

  @override
  bool containsKey({String key}) {
    return _sharedPreferences.containsKey(key);
  }

  @override
  Set<String> getKeys() {
    return _sharedPreferences.getKeys();
  }

  @override
  Either<SharedPreferencesException, bool> getBool({String key}) {
    try {
      final result = _sharedPreferences.getBool(key);
      if (result != null) {
        return right(result);
      }
      return left(const SharedPreferencesException.notFound());
    } catch (e) {
      return left(const SharedPreferencesException.invalidType());
    }
  }

  @override
  Either<SharedPreferencesException, double> getDouble({String key}) {
    try {
      final result = _sharedPreferences.getDouble(key);
      if (result != null) {
        return right(result);
      }
      return left(const SharedPreferencesException.notFound());
    } catch (e) {
      return left(const SharedPreferencesException.invalidType());
    }
  }

  @override
  Either<SharedPreferencesException, int> getInt({String key}) {
    try {
      final result = _sharedPreferences.getInt(key);
      if (result != null) {
        return right(result);
      }
      return left(const SharedPreferencesException.notFound());
    } catch (e) {
      return left(const SharedPreferencesException.invalidType());
    }
  }

  @override
  Either<SharedPreferencesException, List<String>> getListString({String key}) {
    try {
      final result = _sharedPreferences.getStringList(key);
      if (result != null) {
        return right(result);
      }
      return left(const SharedPreferencesException.notFound());
    } catch (e) {
      return left(const SharedPreferencesException.invalidType());
    }
  }

  @override
  Either<SharedPreferencesException, String> getString({String key}) {
    try {
      final result = _sharedPreferences.getString(key);
      if (result != null) {
        return right(result);
      }
      return left(const SharedPreferencesException.notFound());
    } catch (e) {
      return left(const SharedPreferencesException.invalidType());
    }
  }

  @override
  Future<bool> remove({String key}) {
    return _sharedPreferences.remove(key);
  }

  @override
  Future<bool> setBool({String key, bool value}) {
    return _sharedPreferences.setBool(key, value);
  }

  @override
  Future<bool> setDouble({String key, double value}) {
    return _sharedPreferences.setDouble(key, value);
  }

  @override
  Future<bool> setInt({String key, int value}) {
    return _sharedPreferences.setInt(key, value);
  }

  @override
  Future<bool> setListString({String key, List<String> value}) {
    return _sharedPreferences.setStringList(key, value);
  }

  @override
  Future<bool> setString({String key, String value}) {
    return _sharedPreferences.setString(key, value);
  }

}
