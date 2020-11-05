import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:trickster/core/error/shared_preferences_exception.dart';
import 'package:trickster/data/datasource/shared_preferences_datasource.dart';
import 'package:trickster/data/model/user_preferences_dto.dart';
import 'package:trickster/data/util/user_preferences_mapper.dart';
import 'package:trickster/domain/constants/preferences.dart';
import 'package:trickster/domain/entity/user_preferences.dart';
import 'package:trickster/domain/repository/i_shared_preferences_repository.dart';

@lazySingleton
@RegisterAs(ISharedPreferencesRepository)
class SharedPreferencesRepository implements ISharedPreferencesRepository {
  final ISharedPreferencesDatasource _sharedPreferencesDatasource;

  SharedPreferencesRepository(
    this._sharedPreferencesDatasource,
  );

  @override
  Either<SharedPreferencesException, UserPreferences> getUserPreferences() {
    return _sharedPreferencesDatasource
        .getString(key: Preferences.USER_PREFERENCES)
        .fold(
            (l) => left(l),
            (r) => right(UserPreferencesMapper().fromDto(
                UserPreferencesDto.fromJson(
                    cast<Map<String, dynamic>>(json.decode(r))))));
  }

  @override
  Future<bool> setUserPreferences(UserPreferences userPreferences) async {
    return _sharedPreferencesDatasource.setString(
        key: Preferences.USER_PREFERENCES,
        value: jsonEncode(
            UserPreferencesDto.fromEntity(userPreferences).toJson()));
  }
}
