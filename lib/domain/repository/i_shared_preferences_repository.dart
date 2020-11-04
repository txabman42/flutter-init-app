import 'package:dartz/dartz.dart';
import 'package:trickster/core/error/shared_preferences_exception.dart';
import 'package:trickster/domain/entity/user_preferences.dart';

abstract class ISharedPreferencesRepository {
  Either<SharedPreferencesException, UserPreferences> getUserPreferences();

  Future<bool> setUserPreferences(UserPreferences userPreferences);
}